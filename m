From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] net/7990: Make lance_private.name const
Date: Tue, 12 Nov 2013 16:12:53 -0500 (EST)
Message-ID: <20131112.161253.601617211955537751.davem@davemloft.net>
References: <1384283649-10482-1-git-send-email-geert@linux-m68k.org>
	<5282A5E1.9090501@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:37364 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753427Ab3KLVMz (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 12 Nov 2013 16:12:55 -0500
In-Reply-To: <5282A5E1.9090501@cogentembedded.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: sergei.shtylyov@cogentembedded.com
Cc: geert@linux-m68k.org, netdev@vger.kernel.org, linux-m68k@vger.kernel.org

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Wed, 13 Nov 2013 01:04:17 +0300

>> @@ -100,7 +100,7 @@ struct lance_init_block {
>>    */
>>   struct lance_private
>>   {
>> -        char *name;
>> +        const char *name;
> 
>    Indent with tab, not spaces, please.

This whole file is %99 space indentation, you really can't blame
Geert for this.
