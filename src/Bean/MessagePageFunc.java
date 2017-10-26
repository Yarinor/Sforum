package Bean;

public class MessagePageFunc {
	
	public String commentOrTopic(String param, int topicId){
		 TopicHdao topicHdao= new TopicHdao();
		Topic topic= topicHdao.findTopicById(topicId);
		if(param.equals("true")){
			return  topic.getTopicTitle();
		}
		
		return "";
	}
	
	public String checkDisabled(String tester){
		if(tester.equals("")){
			return "";
		}
		return "disabled";
	}

}
