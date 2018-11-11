<% if (request.getParameter("adderror") != null) {%>
<div class="alert alert-danger" role="alert">
    ${adderror}
</div> 
<% }%>
<% if(request.getParameter("addmsg")!=null){%>
    <div class="alert alert-danger" role="alert">
    ${addmsg}
</div> 
<% } %>
<div class="jumbotron">
    <h2 class="text-center display-3">
        <i class="fas fa-plus"></i>
        Add Questions
    </h2>
    <hr class="my-3"/>
    <form action="/CS121/add" method="post">
        <div class="form-group">
            <label for="question">Question</label>
            <textarea name="q" id="question" class="form-control" rows="4" maxlength="500" placeholder="Question (Max. 500chars)" required></textarea>
        </div>
        <hr/>
        <h5 class="text-center display-4">Options</h5>
        <div class="form-group">
            <label for="a">A</label>
            <textarea name="a" id="a" class="form-control" rows="2" maxlength="150" placeholder="Option A (Max. 150chars)" required></textarea>
        </div>
        <div class="form-group">
            <label for="b">B</label>
            <textarea name="b" id="b" class="form-control" rows="2" maxlength="150" placeholder="Option B (Max. 150chars)" required></textarea>
        </div>
        <div class="form-group">
            <label for="c">C</label>
            <textarea name="c" id="c" class="form-control" rows="2" maxlength="150" placeholder="Option C (Max. 150chars)" required></textarea>
        </div>
        <div class="form-group">
            <label for="d">D</label>
            <textarea name="d" id="d" class="form-control" rows="2" maxlength="150" placeholder="Option D (Max. 150chars)" required></textarea>
        </div>
        <hr/>
        <h5 class="text-center display-4 mb-3">Answer</h5>
        <div class="d-flex flex-row flex-wrap" style="justify-content: space-evenly">
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="answerRadios" id="answerRadios1" value="0" checked>
                <label class="form-check-label" for="answerRadios1">
                    Option A
                </label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="answerRadios" id="answerRadios2" value="1">
                <label class="form-check-label" for="answerRadios2">
                    Option B
                </label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="answerRadios" id="answerRadios3" value="2">
                <label class="form-check-label" for="answerRadios3">
                    Option C
                </label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="answerRadios" id="answerRadios4" value="3">
                <label class="form-check-label" for="answerRadios4">
                    Option D
                </label>
            </div>
        </div>
        <button class="btn btn-primary btn-lg mt-5 ml-auto d-block w-100" type="submit">
            <i class="fas fa-plus"></i>
            Add Question
        </button>
    </form>
</div>