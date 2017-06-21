#include "mapfile.h"

#include <QUrl>
#include <QVariantList>
#include <QVariant>
#include <QDebug>

MapFile::MapFile(QObject *parent) : QObject(parent)
{

}

QVariantList MapFile::open(QUrl url) {
    QVariantList map;
    QFile file(url.path());
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
        return map;

    QTextStream in(&file);
    while (!in.atEnd()) {
        QString line = in.readLine();
        QStringList parsedLine = line.split(" ", QString::SkipEmptyParts);
        foreach (QString item, parsedLine) {
            map << item;
        }
    }

    return map;
}

void MapFile::save(QUrl url, QVariantList map) {
    QFile file(url.path());
    if (!file.open(QIODevice::WriteOnly | QIODevice::Text))
        return;

    QTextStream out(&file);
    foreach (QVariant item, map) {
        out << item.toString() << " ";
    }
}
