package dev.department.subscribe.handler;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import dev.department.subscribe.dto.AdminIdentifierDTO;
import dev.department.subscribe.dto.MemberDTO;
import dev.department.subscribe.service.MemberService;
import dev.department.subscribe.service.PickupService;
import lombok.extern.slf4j.Slf4j;

@Slf4j

@Configuration

public class NoticeWebSocketHandler extends TextWebSocketHandler {

	@Autowired

	MemberService memberService;

	@Autowired

	PickupService pickupService;

	private Map<AdminIdentifierDTO, WebSocketSession> receivers = new ConcurrentHashMap<>();

	private Map<AdminIdentifierDTO, String> test = new ConcurrentHashMap<>();

	@Override

	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		log.info("afterConnectionEstablished");

		int userType = getUserType(session);

		log.info("userType : {}", userType);

		if (userType == 1) {

			MemberDTO memberInfo = memberService.getAdminIdentifier(session.getPrincipal().getName());

			receivers.put(new AdminIdentifierDTO(memberInfo.getBrandNo(), memberInfo.getStoreNo()), session);

		}

		log.info(receivers.toString());

	}

	@Override

	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		log.info("afterConnectionClosed");

	}

	@Override

	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		String msg = message.getPayload();

		JSONObject data = getJsonDataFromMsg(msg);

		log.info("메시지:{}", msg);

		String command = (String) data.get("command");

		JSONObject sendNotice = new JSONObject();

		if (command.equals("예약 요청")) {

			int brandNo = Integer.parseInt((String) data.get("brandNo"));

			int storeNo = Integer.parseInt((String) data.get("storeNo"));

			sendNotice.put("command", command);

			sendNotice.put("content1", memberService.getAdminIdentifier(session.getPrincipal().getName()).getName());

			sendNotice.put("content2", (String) data.get("reserveDate"));

			WebSocketSession receiver = getReceiver(new AdminIdentifierDTO(brandNo, storeNo));

			receiver.sendMessage(new TextMessage(sendNotice.toJSONString()));

		} else if (command.equals("픽업 주문")) {

			int storeNo = Integer.parseInt((String) data.get("storeNo"));

			sendNotice.put("command", command);

			int brandNo = pickupService.getBrandNo(Integer.parseInt((String) data.get("productNo")));

			sendNotice.put("content1", (String) data.get("productNo") + "번 제품");

			sendNotice.put("content2", (String) data.get("reserveDate"));

			WebSocketSession receiver = getReceiver(new AdminIdentifierDTO(brandNo, storeNo));

			receiver.sendMessage(new TextMessage(sendNotice.toJSONString()));

		}

	}

	@Override

	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {

		// TODO Auto-generated method stub

		super.handleTransportError(session, exception);

	}

	private JSONObject getJsonDataFromMsg(String msg) throws Exception {

		JSONParser parser = new JSONParser();

		Object obj = parser.parse(msg);

		return (JSONObject) obj;

	}

	private WebSocketSession getReceiver(AdminIdentifierDTO identifier) {

		WebSocketSession session = receivers.get(identifier);

		return session;

	}

	private int getUserType(WebSocketSession session) {

		String path = session.getUri().getPath();

		return Integer.parseInt(path.substring(path.lastIndexOf("/") + 1));

	}

}