#include "score.h"
#include "QDebug"


score::score(QObject *parent) : QObject(parent)
{

}

QString score::readfile()
{
    QFile file("assets/score.txt");
    if(!file.open(QIODevice::ReadOnly)) {

    }

    QTextStream in(&file);
    QString line,score;
    QStringList listscore;

    line = in.readLine();
    listscore = line.split(QRegExp(" "));
    score = listscore[0];



    return score;
}

void score::writefile(int score)
{

    QFile file("assets/score.txt");
    if(!file.open(QIODevice::WriteOnly)) {

    }
    QTextStream in(&file);


        in << QString::number(score);


}

