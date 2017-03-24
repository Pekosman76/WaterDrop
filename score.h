#ifndef SCORE_H
#define SCORE_H

#include <QObject>
#include <QFile>
#include <QString>
#include <QStringList>

class score : public QObject
{
    Q_OBJECT
public:
    explicit score(QObject *parent = 0);


signals:

public slots:
    QString readfile();
    void writefile(int score);
};

#endif // SCORE_H
