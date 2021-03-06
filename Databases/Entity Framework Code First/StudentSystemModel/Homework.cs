﻿namespace StudentSystemModel
{
    using System;

    public class Homework
    {
        public int Id { get; set; }

        public DateTime TimeSent { get; set; }

        public int HomeworkContentId { get; set; }

        public virtual HomeworkContent Content { get; set; }

        public int StudentId { get; set; }

        public virtual Student Student { get; set; }

        public int CourseId { get; set; }

        public virtual Course Course { get; set; }
    }
}
