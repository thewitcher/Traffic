#include <QString>
#include <QtTest>

class SimpleUnitTestsTest : public QObject
{

	Q_OBJECT

public:
	SimpleUnitTestsTest();

private Q_SLOTS:
	void simpleTest();
};

SimpleUnitTestsTest::SimpleUnitTestsTest()
{
}

void SimpleUnitTestsTest::simpleTest()
{
	QVERIFY2( true, "Failure" );
}

QTEST_APPLESS_MAIN(SimpleUnitTestsTest)

#include "tst_simpleunitteststest.moc"
