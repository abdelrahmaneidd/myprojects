--cleaning data in sql 
SELECT *
FROM [Nashville Housing Data for Data Cleaning]

--standardize date formate 

SELECT SaleDate,CONVERt(date,saleDate)
FROM [Nashville Housing Data for Data Cleaning]

update [Nashville Housing Data for Data Cleaning]
set SaleDate= CONVERt(date,saleDate)

alter table [Nashville Housing Data for Data Cleaning]
add SaleDateConverted Date;

update [Nashville Housing Data for Data Cleaning]
set SaleDateConverted= CONVERt(date,saleDate)

SELECT SaleDateConverted,CONVERt(date,saleDate)
FROM [Nashville Housing Data for Data Cleaning]

--populate property adress data 


SELECT PropertyAddress
FROM [Nashville Housing Data for Data Cleaning]
where PropertyAddress is null

select a.ParcelID , a.PropertyAddress ,b.ParcelID,b.PropertyAddress,isnull(a.PropertyAddress,b.PropertyAddress)
from [Nashville Housing Data for Data Cleaning] a
join [Nashville Housing Data for Data Cleaning] b
 on a.ParcelID=b.ParcelID
 and a.UniqueID <> b.UniqueID
 where a.PropertyAddress is null

 update a
 set PropertyAddress=isnull(a.PropertyAddress,b.PropertyAddress)
 from [Nashville Housing Data for Data Cleaning] a
join [Nashville Housing Data for Data Cleaning] b
 on a.ParcelID=b.ParcelID
 and a.UniqueID <> b.UniqueID
 where a.PropertyAddress is null

 --breaking out adress into individual columns  

 SELECT PropertyAddress
FROM [Nashville Housing Data for Data Cleaning]

SELECT 
SUBSTRING(PropertyAddress,1,CHARINDEX(',',PropertyAddress)-1) as Address,
SUBSTRING(PropertyAddress,CHARINDEX(',',PropertyAddress) +1 ,LEN(PropertyAddress))as Address
from [Nashville Housing Data for Data Cleaning]


alter table [Nashville Housing Data for Data Cleaning]
add PropertySplitAddress nvarchar(255);

update [Nashville Housing Data for Data Cleaning]
set PropertySplitAddress= SUBSTRING(PropertyAddress,1,CHARINDEX(',',PropertyAddress)-1)

alter table [Nashville Housing Data for Data Cleaning]
add PropertySplitCity nvarchar(255);

update [Nashville Housing Data for Data Cleaning]
set PropertySplitCity= SUBSTRING(PropertyAddress,CHARINDEX(',',PropertyAddress) +1 ,LEN(PropertyAddress))


select 
PARSENAME(replace(OwnerAddress,',','.'),3),
PARSENAME(replace(OwnerAddress,',','.'),2),
PARSENAME(replace(OwnerAddress,',','.'),1)
from [Nashville Housing Data for Data Cleaning]


alter table [Nashville Housing Data for Data Cleaning]
add OwnerSplitAddress nvarchar(255);

update [Nashville Housing Data for Data Cleaning]
set OwnerSplitAddress= PARSENAME(replace(OwnerAddress,',','.'),3)

alter table [Nashville Housing Data for Data Cleaning]
add OwnerSplitCity nvarchar(255);

update [Nashville Housing Data for Data Cleaning]
set OwnerSplitCity= PARSENAME(replace(OwnerAddress,',','.'),2)

alter table [Nashville Housing Data for Data Cleaning]
add OwnerSplitState nvarchar(255);

update [Nashville Housing Data for Data Cleaning]
set OwnerSplitState= PARSENAME(replace(OwnerAddress,',','.'),1)

select *
from [Nashville Housing Data for Data Cleaning]


--change Y and N to yes and no 

select SoldAsVacant
,case when SoldAsVacant='y' then 'yes'
      when SoldAsVacant='N' then 'No'
	  else SoldAsVacant
	  end

from [Nashville Housing Data for Data Cleaning]


update [Nashville Housing Data for Data Cleaning]
set SoldAsVacant=case when SoldAsVacant='y' then 'yes'
      when SoldAsVacant='N' then 'No'
	  else SoldAsVacant
	  end


--remove duplicates

with RowNumCTE as(
select * ,
  ROW_NUMBER() over (
  partition by ParcelID,
                PropertyAddress,
				SaleDate,
				LegalReference
				ORDER BY
				UniqueId
				) row_num
from [Nashville Housing Data for Data Cleaning]
--order by ParcelID
)
SELECT *
from RowNumCTE
where row_num >1