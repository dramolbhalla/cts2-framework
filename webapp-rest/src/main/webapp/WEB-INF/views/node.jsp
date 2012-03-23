<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://informatics.mayo.edu/cts2/framework#beans"
	prefix="beans"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<c:if test="${map != null}">
	<ul>
		<c:forEach var="i" items="${map}">

			<c:if test="${i.key != null and i.value != null }">
				<li><c:out value="${i.key}"></c:out> 
				
				
				<c:if test="${fn:endsWith(i.key, 'List')}">
				<ul>
					<c:forEach var="j" items="${i.value}">
						<li>
							<c:out value="${fn:substringBefore(i.key, 'List') }"></c:out>
							<c:if test="${beans:shouldRecurse( j )}">
								<c:set var="map" value="${beans:inspect( j ) }"
									scope="request" />
								<jsp:include page="node.jsp" />
							</c:if> 
							<c:if test="${ not beans:shouldRecurse( j )}">
								<c:out value="${j}"></c:out>
							</c:if>
						</li>
					</c:forEach>
				</ul>
				</c:if>
				<c:if test="${not fn:endsWith(i.key, 'List')}">
					<c:if test="${beans:shouldRecurse(i.value)}">
							<c:set var="map" value="${beans:inspect( i.value) }"
								scope="request" />
							<jsp:include page="node.jsp" />
					</c:if> 
					<c:if test="${ not beans:shouldRecurse(i.value)}">
						<c:out value="${i.value}"></c:out>
					</c:if>
				</c:if>
				</li>

			</c:if>
		</c:forEach>
	</ul>
</c:if>