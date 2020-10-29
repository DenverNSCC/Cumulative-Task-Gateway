;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	sysninja. root.sysninja. (
			      5		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	sysninja.
@	IN	A	192.168.1.10
ns	IN	A	192.168.1.10
*       IN      A       192.168.1.10
