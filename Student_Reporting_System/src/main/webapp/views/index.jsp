<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Index</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>


<div class="container-lg text-center">
    <h1 class="text-center" style="margin-left: -2.5%">Salesken Assignment</h1>
    <br><br>

    <button type="button" class="btn btn-primary mx-4 my-2 px-5 py-3" data-bs-toggle="modal" data-bs-target="#addStudent">
        Add Student</button>

    <button type="button" class="btn btn-danger mx-4 my-2 px-5 py-3" data-bs-toggle="modal" data-bs-target="#deleteS">
    Delete Student</button>
</div>

<!-- add marks Modal -->
<div class="modal fade" id="add" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel0" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel0">Add Marks</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form action = "/addSemMarks" method = "POST">
                    <div class="mb-3">
                        <label for="StudentId" class="form-label">Student Id</label>
                        <input type="text" class="form-control" id="StudentId" required  name="Id">
                    </div>
                    <div class="mb-3">
                        <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" required name="semId">
                            <option value="1">One</option>
                            <option value="2">Two</option>
                        </select>
                    </div>
<%--                    <div class="mb-3">--%>
<%--                        <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" required name="subject">--%>
<%--                            <option value="English">English</option>--%>
<%--                            <option value="Maths">Maths</option>--%>
<%--                            <option value="Science">Science</option>--%>
<%--                        </select>--%>
<%--                    </div>--%>
                    <div class="mb-3">
                        <label for="Emarks" class="form-label">English Marks</label>
                        <input type="number" class="form-control" id="Emarks"  min="0" max="100" name="English">
                    </div>
                    <div class="mb-3">
                        <label for="Mmarks" class="form-label">Maths Marks</label>
                        <input type="number" class="form-control" id="Mmarks"  min="0" max="100" name="Maths">
                    </div>
                    <div class="mb-3">
                        <label for="Smarks" class="form-label">Science Marks</label>
                        <input type="number" class="form-control" id="Smarks"  min="0" max="100" name="Science">
                    </div>


                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Add Marks</button>
                    </div>

                </form>
            </div>

        </div>
    </div>
</div>



<!-- delete Modal -->
<div class="modal fade" id="deleteS" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel1">Delete Student</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form action = "/deleteStudent" method = "POST">
                    <div class="mb-3">
                        <label for="SId" class="form-label">Student Id</label>
                        <input type="text" class="form-control" id="SId" required name="SId">
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-danger">Delete</button>
                    </div>

                </form>

            </div>

        </div>
    </div>
</div>


<!-- add student Modal -->
<div class="modal fade" id="addStudent" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel2">Add Student</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form action = "/addStudent" method = "POST">
                    <div class="mb-3">
                        <label for="SName" class="form-label">Student Name</label>
                        <input type="text" class="form-control" id="SName" required name="SName">
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Add Student</button>
                    </div>

                </form>

            </div>

        </div>
    </div>
</div>


<div class="container justify-content-center">
<div class="col-auto">
<table class="table table-dark table-striped table-responsive text-center">
<thead>
<tr>
    <th scope="col">Id</th>
    <th scope="col">Name</th>
    <th scope="col">Maths_1</th>
    <th scope="col">Maths_2</th>
    <th scope="col">Maths_Avg</th>
    <th scope="col">English_1</th>
    <th scope="col">English_2</th>
    <th scope="col">English_Avg</th>
    <th scope="col">Science_1</th>
    <th scope="col">Science_2</th>
    <th scope="col">Science_Avg</th>
    <th scope="col">Add/Update Marks</th>
</tr>
</thead>
<tbody>

<c:forEach items="${students}" var="s">
    <tr>
        <td>${s.getId()}</td>
        <td>${s.getName()}</td>
        <td>${s.getSemesters().get(0).getMaths()}</td>
        <td>${s.getSemesters().get(1).getMaths()}</td>
        <td>${(s.getSemesters().get(0).getMaths() + s.getSemesters().get(1).getMaths())/2}</td>
        <td>${s.getSemesters().get(0).getEnglish()}</td>
        <td>${s.getSemesters().get(1).getEnglish()}</td>
        <td>${(s.getSemesters().get(0).getEnglish() + s.getSemesters().get(1).getEnglish())/2}</td>
        <td>${s.getSemesters().get(0).getScience()}</td>
        <td>${s.getSemesters().get(1).getScience()}</td>
        <td>${(s.getSemesters().get(0).getScience() + s.getSemesters().get(1).getScience())/2}</td>
        <td><button type="button" class="btn btn-success mx-2 my-1 px-2 py-1" data-bs-toggle="modal" data-bs-target="#add" id="addUpdate">
            Add/Update Marks</button></td>
    </tr>
</c:forEach>

</tbody>
</table>
</div>
</div>

<div class="container text-center mx-auto">
    <button type="button" class="btn btn-dark mx-3 my-4 py-3 px-2">average% Sem1 : ${averageClass1}%</button>
    <button type="button" class="btn btn-dark mx-3 my-4 py-3 px-2">average% Sem2 : ${averageClass2}%</button>

    <button type="button" class="btn btn-dark mx-3 my-4 py-3 px-2" data-bs-toggle="modal" data-bs-target="#first"> Top1 </button>
    <button type="button" class="btn btn-dark mx-3 my-4 py-3 px-2" data-bs-toggle="modal" data-bs-target="#second"> Top2 </button>


</div>


<!-- 1 top Modal -->
<div class="modal fade" id="first" tabindex="-1" aria-labelledby="top1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="top1">1st Top Student</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form>
                    <div class="row g-3 align-items-center">
                        <div class="col-auto mx-auto">
                            <label for="top1ID" class="col-form-label">StudentId</label>
                        </div>
                        <div class="col-auto mx-auto">
                            <input type="text" id="top1ID" class="form-control form-control-lg" value="${top1}"  readonly >
                        </div>
                    </div>
                    <br>
                    <div class="row g-3 align-items-center">
                        <div class="col-auto mx-auto">
                            <label for="top1Score" class="col-form-label">Score</label>
                        </div>
                        <div class="col-auto mx-auto">
                            <input type="text" id="top1Score" class="form-control form-control-lg" value="${top1_score}"  readonly>
                        </div>
                    </div>
                    <br>
                    <div class="row g-3 align-items-center">
                        <div class="col-auto mx-auto">
                            <label for="top1Name" class="col-form-label">Name</label>
                        </div>
                        <div class="col-auto mx-auto">
                            <input type="text" id="top1Name" class="form-control form-control-lg" value="${top1_name}"  readonly>
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>


<!-- 2 top Modal -->
<div class="modal fade" id="second" tabindex="-1" aria-labelledby="top2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="top2">2nd Top Student</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row g-3 align-items-center">
                        <div class="col-auto mx-auto">
                            <label for="top2ID" class="col-form-label">StudentId</label>
                        </div>
                        <div class="col-auto mx-auto">
                            <input type="text" id="top2ID" class="form-control form-control-lg" value="${top2}" readonly>
                        </div>
                    </div>
                    <br>
                    <div class="row g-3 align-items-center">
                        <div class="col-auto mx-auto">
                            <label for="top2Score" class="col-form-label">Score</label>
                        </div>
                        <div class="col-auto mx-auto">
                            <input type="text" id="top2Score" class="form-control form-control-lg" value="${top2_score}"  readonly>
                        </div>
                    </div>
                    <br>
                    <div class="row g-3 align-items-center">
                        <div class="col-auto mx-auto">
                            <label for="top2Name" class="col-form-label">Name</label>
                        </div>
                        <div class="col-auto mx-auto">
                            <input type="text" id="top2Name" class="form-control form-control-lg" value="${top2_name}"  readonly>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>