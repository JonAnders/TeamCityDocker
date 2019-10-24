using System;

using NUnit.Framework;

using TeamCityDocker.Web;

namespace TeamCityDocker.UnitTests
{
    public class PodBayDoorsTests
    {
        [Test]
        public void Open_WillNotOpen()
        {
            var podBayDoors = new PodBayDoors();

            var exception = Assert.Throws<InvalidOperationException>(podBayDoors.Open);

            Assert.That(exception.Message, Is.EqualTo("I'm sorry, Dave. I'm afraid I can't do that."));
        }
    }
}