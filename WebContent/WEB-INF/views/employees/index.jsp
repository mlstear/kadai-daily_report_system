<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2>従業員　一覧</h2>
        <table id="employee_list">
            <tbody>
                <tr>
                    <th>社員番号</th>
                    <th>氏名</th>
                    <th>操作</th>
                </tr>
               <c:forEach var="employee" items="${employees}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td><c:out value="${employee.code}" /></td>
                        <td><c:out value="${employee.name}" /></td>
                        <td>
                            <c:choose>
                                <c:when test="${employee.delete_flag == 1}">
                                    （削除済み）
                                </c:when>
                                <c:otherwise>
                                   <a href="<c:url value='/employees/show?id=${employee.id}' />">詳細を表示</a>&nbsp;&nbsp;&nbsp;

                                   <!--  <c:if test="${sessionScope.login_employee.id !=employee.id}">
                                       <form method="POST" action="<c:url value='/follows/add?employee_id=${employee.id}&employee_name=${employee.name}' />">
                                         <input type="hidden" name="employee.id" value="${employee.id}"/>
                                         <input type="hidden" name="employee.name" value="${employee.name}"/>
                                       </form>
                                    </c:if> -->

                                    <c:set var="flg" value="0" />

                                    <c:if test="${follows != null }">
                                      <c:forEach var="follow" items="${follows}" varStatus="status3">
                                       <c:if test="${follow.followed_id==employee.id}">
                                         <a href="<c:url value='/follows/followIndex?id=${employee.id}' />">日報一覧</a>
                                         <form method="POST" action="<c:url value='/follows/unfollow?follow_id=${follow.id}' />">
                                           <input type="hidden" name="follow.id" value="${follow.id}"/>
                                           <input type="submit" name="unfollow" value="フォロー解除" >
                                         </form>
                                         (フォロー中)
                                         <c:set var="flg" value="1" />
                                       </c:if>
                                      </c:forEach>


                                      <c:if test="${flg==0&&sessionScope.login_employee.id !=employee.id}">
                                        <form method="POST" action="<c:url value='/follows/add?employee_id=${employee.id}&employee_name=${employee.name}' />">
                                         <input type="hidden" name="employee.id" value="${employee.id}"/>
                                         <input type="hidden" name="employee.name" value="${employee.name}"/>
                                         <input type="submit" name="follow" value="フォローする" >
                                        </form>
                                     </c:if>
                                    </c:if>


                                    <c:if test="${follows == null&& sessionScope.login_employee.id !=employee.id}">
                                    <form method="POST" action="<c:url value='/follows/add?employee_id=${employee.id}&employee_name=${employee.name}' />">
                                         <input type="hidden" name="employee.id" value="${employee.id}"/>
                                         <input type="hidden" name="employee.name" value="${employee.name}"/>
                                         <input type="submit" name="follow" value="フォローする" >
                                    </form>

                                    </c:if>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div id="pagination">
            （全 ${employees_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((employees_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/employees/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <p><a href="<c:url value='/employees/new' />">新規従業員の登録</a></p>

    </c:param>
</c:import>