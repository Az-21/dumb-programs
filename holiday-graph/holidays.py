import matplotlib.pyplot as plt
plt.style.use('seaborn-pastel')


# * Get this sting from OCR
x:str = 'PARTICULARS DAY DATE SL.NO. Sankranti Makara Thursday 14-01-2021 1 Republic Day Tuesday 26-01-2021 2 Shivaratri Maha Thursday 11-03-2021 3 3 Good Friday Friday 02-04-2021 4 Holi Fest Saturday 03-04-2021 5 Festival Ugadi Tuesday 13-04-2021 6 Ambedkar Jayanthi Dr.B.R. Wednesday 14-04-2021 7 Saturday May Day 01-05-2021 8 Basava jayanti/Ramzan Friday 14-05-2021 9 Bakrid Wednesday 10 21-07-2021 Moharam Varamahalakshmi Vratha / Friday 11 20-08-2021 12 Gowri Festival Swarna Thursday 09-09-2021 Chaturthi Ganesha 13 10-09-2021 Friday 14 02-10-2021 Gandhi Jayanthi Saturday 15 06-10-2021 Wednesday Mahalaya Amavasye 16 14-10-2021 Ayudha Pooja Thursday 17 Vijayadashami 15-10-2021 Friday 18 20-10-2021 Wednesday Maharshi Valmiki Jayanthi / Ed-Milad 19 01-11-2021 Kannada Monday Rajyotsava 20 03-11-2021 Chaturdashi Naraka - Wednesday Dipawali 21 04-11-2021 Thursday Dipawali 22 05-11-2021 Bali Padyami - Dipawali Friday 23 22-11-2021 Kanakadasa Monday Jayanthi 24 25-12-2021 Christmas Saturday'


# * Count frequencies [NOTE: Sundays skipped]
y:list[str] = x.split(' ')
z:list[int] = [y.count('Monday'), y.count('Tuesday'), y.count('Wednesday'), y.count('Thursday'), y.count('Friday'), y.count('Saturday')]


# * Graph
labels:list[str] = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
fig, ax = plt.subplots()
ax.set_axisbelow(True)
ax.yaxis.grid(color='gray', linestyle='dashed')
bargraph = ax.bar(labels, z)
ax.set_ylabel('Frequency of Holidays')
ax.set_title('LETS GOOOOOOO BATCH 1')
fig.text(.5, 0.01, 'Good Fridays', ha='center')

# Optional grouping by color
for i in range (0, 6, 2):
    bargraph[i].set_color('#AFE7C7')
    bargraph[i].set_edgecolor('#1a1a1a')
    bargraph[i].set_linewidth(1)
    
    
for i in range (1, 7, 2):
    bargraph[i].set_color('#B4DAF7')
    bargraph[i].set_edgecolor('#1a1a1a')
    bargraph[i].set_linewidth(1)
    
    
# * Render bar value on plot
# Straight outta matplotlib documentation; godsent
def autolabel(rects:bargraph):
    for rect in rects:
        height = rect.get_height()
        ax.annotate('{}'.format(height),
                    xy=(rect.get_x() + rect.get_width() / 2, height),
                    xytext=(0, 3),  # 3 points vertical offset
                    textcoords="offset points",
                    ha='center', va='bottom')


autolabel(bargraph)


plt.show()