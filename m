From: =?ISO-8859-1?Q?Mattias_Engdeg=E5rd?= <mattiase@bredband.net>
Subject: Re: FPU emulation incorrect for 68LC040?
Date: Thu, 22 Jul 2010 21:55:28 +0200
Message-ID: <1CC1901B-7E56-4FAF-96A4-8F2F2F5C38A9@bredband.net>
References: <08EC3395-75C3-4E81-B468-C9978DDCF85D@bredband.net> <AANLkTilKXTCUJIOEvQ-H5GjGfPwYV5_QufuD46twmNvS@mail.gmail.com> <41EF646C-8866-4070-B772-94E39EF4620B@bredband.net> <alpine.OSX.2.00.1007221056390.354@localhost>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtprelay-b12.telenor.se ([62.127.194.21]:40721 "EHLO
	smtprelay-b12.telenor.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753290Ab0GVTzn (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 22 Jul 2010 15:55:43 -0400
Received: from ipb3.telenor.se (ipb3.telenor.se [195.54.127.166])
	by smtprelay-b12.telenor.se (Postfix) with ESMTP id 153C0E8232
	for <linux-m68k@vger.kernel.org>; Thu, 22 Jul 2010 21:55:42 +0200 (CEST)
In-Reply-To: <alpine.OSX.2.00.1007221056390.354@localhost>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, zippel@linux-m68k.org

22 jul 2010 kl. 03.05 skrev Finn Thain:

> But if you send me some inline asm, I'll patch it into busybox and  
> test a
> 2.6.34 initramfs for you.

Thanks! Try this:

void test_postinc(void)
{
         double x = 0.0;
         double a[2] = {3.5, 0.0};
         double *p = a;
         __asm__ volatile  ("fneg.d (%0)+,%1" : "+a"(p), "+f"(x));
         printf("postinc: result %f (expected %f), address %p  
(expected %p)\n",
                x, -3.5, p, a + 1);
}

void test_predec(void)
{
         double x = 0.0;
         double a[2] = {-1.75, 0.0};
         double *p = a + 1;
         __asm__ volatile  ("fneg.d -(%0),%1" : "+a"(p), "+f"(x));
         printf("predec: result %f (expected %f), address %p (expected  
%p)\n",
                x, 1.75, p, a);
}
