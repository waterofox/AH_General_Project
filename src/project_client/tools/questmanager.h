#ifndef QUESTMANAGER_H
#define QUESTMANAGER_H
#include <QObject>
#include <QMap>
#include <QDebug>
class QuestManager : public QObject
{
    enum stop_modes
    {
        BlockQuest  = 0,
        UnBlockQuest = 1,
        DeleteQuest = 2
    };
    Q_OBJECT
    struct cords
    {
        int X;
        int Y;
    };
    struct quest_area
    {
        int quest_id;
        int the_point_before_id = -1; //айди предыдущего квеста(этапа). если -1, то его нет
        bool is_active;
        QMap<int,QString> quest_mes;
        cords area_cords;
        int area_height;
        int area_width;
    };
private:
    QMap<int,quest_area> quests_list;
public:
    QuestManager();
    Q_INVOKABLE void reg_new_quest(const int& id, const QString&, const bool& active, const int& b_id); // передаётся строка из всех сообщений в квесте через '/'
    Q_INVOKABLE void rewrite_quests_position( const int& X,  const int& Y,  const int& height,  const int& width ,  const int& id);
    QMap<int,QString> buildQuest(const QString& str);
    void test();
public slots:
    Q_INVOKABLE void change_quest(const int& quest_id, const int& change_mode);

};

#endif // QUESTMANAGER_H
