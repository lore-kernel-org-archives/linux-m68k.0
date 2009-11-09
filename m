From: Joshua Juran <jjuran@gmail.com>
Subject: Re: strncmp uses in arch/m68k/sun3/prom/console.c
Date: Mon, 9 Nov 2009 14:25:57 -0800
Message-ID: <50349937-0165-4DE1-8BBA-EE50EBA7FD98@gmail.com>
References: <1257803313.12852.8.camel@Joe-Laptop.home>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1257803313.12852.8.camel@Joe-Laptop.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Roman Zippel <zippel@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org

On Nov 9, 2009, at 1:48 PM, Joe Perches wrote:

> These might be corrected to sizeof("foo") - 1
>
> arch/m68k/sun3/prom/console.c:          if(strncmp(propb, "serial",  
> sizeof("serial")))
> arch/m68k/sun3/prom/console.c:                  strncmp("display",  
> propb, sizeof("display")) == 0)
> arch/m68k/sun3/prom/console.c:                  if(strncmp 
> ("serial", propb, sizeof("serial")))

May I suggest:

	// Expands to a value equal to strlen( str ), but for string  
constants only,
	// and in constant (zero) time instead of linear time.
	#define STRLEN( str )  (sizeof "" str - 1)
	
	// Expands to two comma-separated values -- the string constant and  
its length.
	#define STR_LEN( str )  str, STRLEN( str )

	if ( strncmp( propb, STR_LEN( "serial" ) ) != 0 )

Also, since you know the length of one of the strings, you could  
safely call memcmp() instead.

Josh
