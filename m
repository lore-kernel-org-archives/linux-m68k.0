From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] net/7990: Make lance_private.name const
Date: Wed, 13 Nov 2013 02:40:38 +0300
Message-ID: <5282BC76.5050701@cogentembedded.com>
References: <1384283649-10482-1-git-send-email-geert@linux-m68k.org>	<5282A5E1.9090501@cogentembedded.com> <20131112.161253.601617211955537751.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-lb0-f170.google.com ([209.85.217.170]:44302 "EHLO
	mail-lb0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757104Ab3KLWke (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 12 Nov 2013 17:40:34 -0500
Received: by mail-lb0-f170.google.com with SMTP id z5so1613131lbh.15
        for <linux-m68k@vger.kernel.org>; Tue, 12 Nov 2013 14:40:33 -0800 (PST)
In-Reply-To: <20131112.161253.601617211955537751.davem@davemloft.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: geert@linux-m68k.org, netdev@vger.kernel.org, linux-m68k@vger.kernel.org

On 11/13/2013 12:12 AM, David Miller wrote:

>>> @@ -100,7 +100,7 @@ struct lance_init_block {
>>>     */
>>>    struct lance_private
>>>    {
>>> -        char *name;
>>> +        const char *name;

>>     Indent with tab, not spaces, please.

> This whole file is %99 space indentation, you really can't blame
> Geert for this.

    It's never late to fix some. And remember about checkpatch.pl which was 
hardly content with the patch.

WBR, Sergei
