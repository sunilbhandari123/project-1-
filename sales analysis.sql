/* seeing the data set*/
select  TOP 3 * from  
Sales.dbo.Superstore

/* In our dataset every this is fine only discount is not converted into percentage we can do it easily by muntiplying it with 100*/
/* lets do explotary data analysis



/ total sale and profit of each year*/
select YEAR([Order Date]) as year,
sum (Sales) as total_sales,
sum (Profit) as total_profit
from Sales.dbo.Superstore
group by YEAR([Order Date])
Order by YEAR([Order Date]) Asc;
/* from the above result we can conclude that the profits increases with a increase in year irrespective of total_sales*/




/* Total profit and total sale per quarter*/
SELECT 
    YEAR([Order Date]) AS year,
    CASE 
        WHEN MONTH([Order Date]) IN (1,2,3) THEN 'Q1'
        WHEN MONTH([Order Date]) IN (4,5,6) THEN 'Q2'
        WHEN MONTH([Order Date]) IN (7,8,9) THEN 'Q3'
        ELSE 'Q4'
    END AS quarter,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM 
    Sales.dbo.Superstore
GROUP BY 
    YEAR([Order Date]),
    CASE 
        WHEN MONTH([Order Date]) IN (1,2,3) THEN 'Q1'
        WHEN MONTH([Order Date]) IN (4,5,6) THEN 'Q2'
        WHEN MONTH([Order Date]) IN (7,8,9) THEN 'Q3'
        ELSE 'Q4'
    END
ORDER BY 
    year,total_profit DESC;
/*Expect in 2017 2 quarter the profit increases with increase in quarter and is maximum in last quarter*/
/* for every year the maximum profit is in last quarter ie in the month of oct,nov and december so we can make plans to utilize this*/
	




/* lets see which region give us highest sales and profits.*/
Select Region ,sum(Sales) as totalsales ,sum(Profit) as totalprofit
from Sales.dbo.Superstore
group by Region
order by totalprofit DESC;
/*  OBSERVATION
1. Here West Region gives up max profit.
2.East is doing well
3.south has high profit percentage instead of having low sell
4.central has more sales than that of south but there profit is low which is the main point to look out 
WHAT CAN WE DO?
1.We should find out whats wrong in Central region why the profits are low 
2.We can focous abit more on South and central region while making plans and staraties.







Lets see profit margins.      */  
select region, Round(sum(Profit)/sum(Sales) * 100,1) as promargin
from Sales.dbo.Superstore
Group by Region
Order by promargin DESC;
/* Observaitons 
As expected west and east have top margins respecti.. south have pretty high margin insted og having low sells but central has low margins.*/





/*  states giving highest sales and profits*/
select Top 10 State,sum(sales)as totalsales,sum(Profit) as totalprofits,Round(sum(Profit)/sum(Sales) * 100,2)as promargins
from Sales.dbo.Superstore
Group by State
Order by totalprofits Desc;
/* OBSERVATIONs
1. California has the highest profits but not profit margin
2. California,New york and washington are out most profitable states.
3. we need to boost our maximum resources and manpower ,customer experience in these top states */





/* Buttom 10 states in term of sales and profits */
select top 10 State,sum(Sales)as totalsale,sum(Profit)as totalprofit
from Sales.dbo.Superstore
group by State
order by totalprofit Asc;
/* OBSERVATIONS
top 3 are Texas, Ohio and Pennsylvania. Texas and Pennsylvania are  alarming as they have more than 100,000 in sales with Texas 
having more sales than Washington (which made 33402.70 in profits) but made a loss of 25729.29 (dollers)*/




/* Top 10 cities in term of sales and profits */
select top 10 City,sum(Sales)as totalsale,sum(Profit)as totalprofit
from Sales.dbo.Superstore
group by City
order by totalprofit Desc;
/* New york los Angeles and seattle are our top profitable cities*/



/* bottom 10 cities in term of sales and profits */
select top 10 City,sum(Sales)as totalsale,sum(Profit)as totalprofit
from Sales.dbo.Superstore
group by City
order by totalprofit Asc;
/*Philadelophia ,Houston San Antonio are the most loss making cities so we have to make new plans and redesigin the startaiges about the 
operation in thoes loss making cities*/

 









 /* Lets find out discount per catergory.*/
 SELECT category,sum(discount) as totaldiscount
 from Sales.dbo.Superstore
 Group by Category
 Order by totaldiscount Desc;
/* Here Office supplies has the maximum discount followed by furniture and technology;*/




/*@ Category that generated the highest sales and profit in each region of the state
@Total Sales and profit and margins of each category*/
select category,sum(Sales) as totalsales,sum(profit) as totalprofit, round(sum(Profit)/sum(Sales)*100,2) as promargin
from Sales.dbo.Superstore
group by Category
order by totalprofit desc;
/* OBSERVATIONS
1.Technology and office supplies have great profit
2.As they have good profit margin they can be seen as future investments*/



/*@ Category that generated the highest sales and profit in each region of the state*/
select region,category,sum(Sales) as totalsales,sum(profit) as totalprofit, round(sum(Profit)/sum(Sales)*100,2) as promargin
from Sales.dbo.Superstore
group by region,Category
order by totalprofit desc;
/* west is in top and 3rd with categories office supplies and technology but in central region furniture is been sold in
loss*/





/*@Highest sales and profit per category in states*/
select State,category,sum(Sales) as totalsales,sum(profit) as totalprofit, round(sum(Profit)/sum(Sales)*100,2) as promargin
from Sales.dbo.Superstore
group by State,Category
order by totalprofit desc;
/*Technology in New York and Washington and Office Supplies in California. are at the top*/



/*@lowest sales and losses per category in states*/
select State,category,sum(Sales) as totalsales,sum(profit) as totalprofit, round(sum(Profit)/sum(Sales)*100,2) as promargin
from Sales.dbo.Superstore
group by State,Category
order by totalprofit Asc;
/* In Texas Office supplies and furniture category are in loss and in Ohio technology  followed by others*/




/*@Now lets see the which subcategory has maximum discount*/
 SELECT category,[Sub-Category],sum(discount) as totaldiscount
 from Sales.dbo.Superstore
 Group by Category,[Sub-Category]
 Order by totaldiscount Desc;
/* Here we can see that Binders is the subcategory which is been discounted the most followed by phones and  Furnishings*/




/*@@@@Subcategory that generates maximum sales and profit in each region and state

@Total sales and profits of each subcategories */
select [Sub-Category],sum(Sales) as totalsales,sum(profit) as totalprofit, round(sum(Profit)/sum(Sales)*100,2) as promargin
from Sales.dbo.Superstore
group by [Sub-Category]
order by totalprofit Desc;
/*biggest profits comes from Copiers, Phones, Accessories and Paper and their margins are also 
good which is good for long term and our losses are comming from Supplies,BookCases,Tables.*/



/*@highest  sales and profits per subcategory in each region:*/
select [Region],[Sub-Category],sum(Sales) as totalsales,sum(profit) as totalprofit, round(sum(Profit)/sum(Sales)*100,2) as promargin
from Sales.dbo.Superstore
group by [Region],[Sub-Category]
order by totalprofit Desc;
/* in west east and central maximum profit are comming from Copier and in West maxprofit are comming from Accessories.*/



/*@lowest sales and  profits per subcategory in each region:*/
select [Region],[Sub-Category],sum(Sales) as totalsales,sum(profit) as totalprofit, round(sum(Profit)/sum(Sales)*100,2) as promargin
from Sales.dbo.Superstore
group by [Region],[Sub-Category]
order by totalprofit Asc;
/* in east south and central tables subcategories are making loss and in central frunishing is making loss*/




/*@Highest total sales and total profits per subcategory in each state:*/
select State,[Sub-Category],sum(Sales) as totalsales,sum(profit) as totalprofit, round(sum(Profit)/sum(Sales)*100,2) as promargin
from Sales.dbo.Superstore
group by State,[Sub-Category]
order by totalprofit Desc;
/* machines phones and blinders are brings highest profits in newyork and Accessories in calfornia and blinders in michigan*/



/*@lowest sales and profits per subcategory in each state:*/
select State,[Sub-Category],sum(Sales) as totalsales,sum(profit) as totalprofit, round(sum(Profit)/sum(Sales)*100,2) as promargin
from Sales.dbo.Superstore
group by State,[Sub-Category]
order by totalprofit Asc;
/* blinders in texas and Illinois and machines in ohio are the top loss makinng subcategories followed by others*/




/*@@@ Products that are most  profitable to us*/
select [Product Name],sum(Sales)as totalsale,sum(Profit) as totalprofit
from Sales.dbo.Superstore
group by [Product Name]
order by totalprofit DESC;
/*Our Top 3 are The Canon imageClass 2200 Advanced Copier, Fellowes PB500 Electric Punch Plastic Comb Binding Machine with Manual Bind 
and the Hewlett Packard LaserJet 3310 Copier*/



/*@@@ Products that are in loss to us*/
select [Product Name],sum(Sales)as totalsale,sum(Profit) as totalprofit
from Sales.dbo.Superstore
group by [Product Name]
order by totalprofit ASC;
/*The Cubify CubeX 3D Printer Double Head Print, Lexmark MX611dhe Monochrome Laser Printer and the Cubify CubeX 3D Printer Triple 
Head Print are the products that are at loss.*/




/*@@@Segment making us more profits*/
select segment,sum(sales) as totalsales,sum(profit)as totalprofits
from Sales.dbo.Superstore
group by Segment
order by totalprofits DESC;
/*Consumers gives us more profit followed by Coporate and Home Office*/





/* Total costumers ,per region ,per states*/
select count(distinct [Customer ID] ) as totalcostumers
 from Sales.dbo.Superstore
/*there are 793 total costumers*/




/*total customers per region*/
select region,count(distinct [Customer ID] ) as totalcostumers
 from Sales.dbo.Superstore
 group by Region
 order by totalcostumers DESC;
/* from observation we can see that there are many duplicate so that it doesnot sum up to 793*/






/*total costumers per states*/
select State,count(distinct [Customer ID] ) as totalcostumers
from Sales.dbo.Superstore
group by State
order by totalcostumers DESC;
 /* California has the maximum number of customers followed by newwork and texas*/





/*least costumers per states*/
select State,count(distinct [Customer ID] ) as totalcostumers
from Sales.dbo.Superstore
group by State
order by totalcostumers Asc;
/* wyoming has the least number of customers followed by west virginia and north Dakota and others*/




/* customers that produces maximum sales*/
select [Customer ID],sum(Sales) totalsales,sum(profit) as totalprofits
from Sales.dbo.Superstore
group by [Customer ID]
order by totalsales DESC;
/*customer ID ‘SM-20320’ is the customer who spent the most with us but is not bringing us profit but his/her loyaloty is with us. 
 customer ID ‘TC-20980’ who is second in the list but brings us the most profit. we should increase their customer experience*/




 /*@ Shipping Time (Average)*/
 select round(AVG( DATEDIFF(day,[Order Date],[Ship Date])),1) as AvgShippingtime
 from Sales.dbo.Superstore
/* Avarage shipping time is 3 days*/






/*@ Shipping Time (Average) vs shipping mode*/
 select [Ship Mode],round(AVG( DATEDIFF(day,[Order Date],[Ship Date])),1) as AvgShippingtime
 from Sales.dbo.Superstore
 group by [Ship Mode]
 order by AvgShippingtime DESC;
/* we can observe standard class shipping mode is max ie 5 days*/

