import pandas as pd
def convert_category_to_age(cat):
    cat_int = int(cat) - 1
    if cat_int > 9:
        return None
    conversion_arr = [
        "24-29", "30-34", "35-39", "40-44","45-49", "50-55", "55-59","60-65", "65-69", "70 and over"
    ]
    return conversion_arr[cat_int]


def generate_age_gender_plot(paths):
    data_coll = []
    for item in paths:
        with open(item, "r") as f:
            df = pd.read_csv(f)
            data_coll.append({
            'x': list(reversed(list(filter(lambda y: y != None, map(lambda x: convert_category_to_age(x), df['category']))))),
            'y': df['male'],
            'type': 'scatter',
            'mode': 'markers',
             'marker': {
                'color': 'blue'
            },
            'name': 'Male'})
            data_coll.append(
            {'x': list(reversed(list(filter(lambda y: y != None, map(lambda x: convert_category_to_age(x), df['category']))))),
            'y': df['female'],
            'type': 'scatter',
            'mode': 'markers',
            'marker': {
                'color': 'magenta'
            },
            'name': 'Female'
            })
    layout = {'title': 'Negative Gearing by Age and Gender',
             'xaxis': {
                    'title': 'Age',
                    'gridwidth': 1,
                    'autorange': 'reversed'
                },
              'yaxis': {
                    'title': 'Asset percentage of salary and wages'
                }
             }
    return data_coll, layout