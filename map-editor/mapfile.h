#ifndef MAPFILE_H
#define MAPFILE_H

#include <QObject>
#include <QFile>
#include <QUrl>
#include <QVariantList>
#include <QVariant>

class MapFile : public QObject
{
    Q_OBJECT
public:
    explicit MapFile(QObject *parent = 0);

    Q_INVOKABLE QVariantList open(QUrl url);
    Q_INVOKABLE void save(QUrl url, QVariantList map);

signals:

public slots:
};

#endif // MAPFILE_H
