import datetime

current_date = datetime.datetime.today()


def current_day():
    today = current_date
    return today.strftime('"%Y-%m-%d"')


def two_weeks_ago():

    two_weeks_back = current_date - datetime.timedelta(days=14)
    return two_weeks_back.strftime('"%Y-%m-%d"')


def previous_business_day():

    if current_date.weekday() == 0:
        last_business_day = current_date - datetime.timedelta(days=3)
        return last_business_day.strftime('"%Y-%m-%d"')

    elif current_date.weekday() == 6:
        last_business_day = current_date - datetime.timedelta(days=2)
        return last_business_day.strftime('"%Y-%m-%d"')

    else:
        last_business_day = current_date - datetime.timedelta(days=1)
        return last_business_day.strftime('"%Y-%m-%d"')


def end_of_previous_week():

    if current_date.weekday() == 0:
        end_of_last_week = current_date - datetime.timedelta(days=2)
        return end_of_last_week.strftime('"%Y-%m-%d"')

    elif current_date.weekday() == 1:
        end_of_last_week = current_date - datetime.timedelta(days=3)
        return end_of_last_week.strftime('"%Y-%m-%d"')

    elif current_date.weekday() == 2:
        end_of_last_week = current_date - datetime.timedelta(days=4)
        return end_of_last_week.strftime('"%Y-%m-%d"')

    elif current_date.weekday() == 3:
        end_of_last_week = current_date - datetime.timedelta(days=5)
        return end_of_last_week.strftime('"%Y-%m-%d"')

    elif current_date.weekday() == 4:
        end_of_last_week = current_date - datetime.timedelta(days=6)
        return end_of_last_week.strftime('"%Y-%m-%d"')

    elif current_date.weekday() == 5:
        end_of_last_week = current_date - datetime.timedelta(days=7)
        return end_of_last_week.strftime('"%Y-%m-%d"')

    elif current_date.weekday() == 6:
        end_of_last_week = current_date - datetime.timedelta(days=8)
        return end_of_last_week.strftime('"%Y-%m-%d"')


def end_of_previous_month():
    end_of_last_month = current_date.replace(day=1) - datetime.timedelta(days=1)
    return end_of_last_month.strftime('"%Y-%m-%d"')


def end_of_previous_quarter():

    if current_date.month < 4:
        end_of_last_quarter = datetime.date(current_date.year - 1, 12, 31)
        return end_of_last_quarter.strftime('"%Y-%m-%d"')

    elif current_date.month < 7:
        end_of_last_quarter = datetime.date(current_date.year, 3, 31)
        return end_of_last_quarter.strftime('"%Y-%m-%d"')

    elif current_date.month < 10:
        end_of_last_quarter = datetime.date(current_date.year, 6, 30)
        return end_of_last_quarter.strftime('"%Y-%m-%d"')

    else:
        end_of_last_quarter = datetime.date(current_date.year, 9, 30)
        return end_of_last_quarter.strftime('"%Y-%m-%d"')


def end_of_previous_year():
    end_of_last_year = datetime.date(current_date.year - 1, 12, 31)
    return end_of_last_year.strftime('"%Y-%m-%d"')
