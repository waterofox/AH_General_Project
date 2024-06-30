#include "questmanager.h"

QuestManager::QuestManager() {}

void QuestManager::reg_new_quest(const int& id, const QString& mes, const bool& active, const int& b_id)
{
    if(this->quests_list.contains(id))    {return;}
    if(!this->quests_list.contains(b_id) &&  b_id != -1) {return;}

    quest_area new_quest;
    new_quest.quest_id = id;
    new_quest.is_active = active;
    new_quest.the_point_before_id = b_id;
    new_quest.quest_mes = buildQuest(mes);

    this->quests_list.insert(id,new_quest);
}

void QuestManager::rewrite_quests_position(const int &X, const int &Y, const int &height, const int &width, const int &id)
{
    auto quest = this->quests_list.find(id);
    quest->area_cords.X = X;
    quest->area_cords.Y = Y;
    quest->area_height = height;
    quest->area_width = width;
}

QMap<int, QString> QuestManager::buildQuest(const QString &str)
{
    QMap<int,QString> quest;
    QString Buffer = "";
    for(int i = 0; i < str.length(); ++i)
    {
        if(str[i] == '/')
        {
            if(quest.isEmpty()){quest.insert(0,Buffer);}
            else{quest.insert(quest.key(quest.last())+1,Buffer);}
            Buffer = "";
        }
        else
        {
            Buffer += str[i];
        }
    }
    return quest;
}

void QuestManager::test()
{
    for (auto it = this->quests_list.begin(); it  != this->quests_list.end(); ++it)
    {
        qDebug() << it->quest_mes;
    }
}

void QuestManager::change_quest(const int &quest_id, const int &change_mode)
{
    auto quest = this->quests_list.find(quest_id);
    switch (change_mode) {
    case QuestManager::stop_modes::BlockQuest: {quest->is_active = false;}
        break;
    case QuestManager::stop_modes::UnBlockQuest: {quest->is_active = true;}
        break;
    case QuestManager::stop_modes::DeleteQuest: {this->quests_list.remove(quest_id);}
    default:
        break;
    }
}
