#include <QString>
#include <QtTest>

class SimpleUnitTests1Test : public QObject
{

	Q_OBJECT

public:
	SimpleUnitTests1Test();

private Q_SLOTS:
	void testCase1();
};

SimpleUnitTests1Test::SimpleUnitTests1Test()
{
}

void SimpleUnitTests1Test::testCase1()
{
	QVERIFY2( true, "Failure" );
}

QTEST_APPLESS_MAIN( SimpleUnitTests1Test )

#include "tst_simpleunittests1test.moc"
