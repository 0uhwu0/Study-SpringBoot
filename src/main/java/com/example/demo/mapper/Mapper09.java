package com.example.demo.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.example.demo.domain.*;

@Mapper
public interface Mapper09 {

	@Select("""
			<script>
			SELECT COUNT(*)
			FROM Customers
			WHERE Country IN (
			
			<foreach collection="elems" item="elem" separator=", ">
				#{elem}
			</foreach>
			
			)
			</script>
			""")
	public Integer sql1(List<String> elems);

	@Select("""
			<script>
			SELECT 
				SupplierId id,
				SupplierName name,
				contactName,
				address,
				city,
				country,
				postalCode,
				phone
			FROM Suppliers
			<where>
				<if test="countryList neq null">
				Country In(
					<foreach collection="countryList" item="country" separator=", ">
						#{country}
					</foreach>
				)
				</if>
			</where>
			</script>
			""")
	public List<Supplier> sql2(List<String> countryList);
}
