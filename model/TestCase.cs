using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PRF192_PE_GradeClient.model
{
    class TestCase
    {
        private string questionName;
        Dictionary<string,List<string>> listTestCase;

        public TestCase()
        {
        }

        public TestCase(string questionName, Dictionary<string, List<string>> listTestCase)
        {
            this.questionName = questionName;
            this.listTestCase = listTestCase;
        }

        public string QuestionName { get => questionName; set => questionName = value; }
        public Dictionary<string, List<string>> ListTestCase { get => listTestCase; set => listTestCase = value; }
    }
}
