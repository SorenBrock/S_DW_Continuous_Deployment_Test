﻿using Dynamicweb;
using Dynamicweb.Extensibility;

namespace CustomModules.HelloWorld
{
    [AddInName("HelloWorld")]
    public class HelloWorld : ContentModule
    {

        public override string GetContent()
        {
            //TODO: Add code here
            return Properties["HelloText"].ToString();
        }

    }
}