From: =?ISO-8859-1?Q?Mattias_Engdeg=E5rd?= <mattiase@bredband.net>
Subject: Re: FPU emulation incorrect for 68LC040?
Date: Fri, 23 Jul 2010 10:39:45 +0200
Message-ID: <EF635C61-D531-4130-A94C-C3C6A0B1592B@bredband.net>
References: <08EC3395-75C3-4E81-B468-C9978DDCF85D@bredband.net> <AANLkTilKXTCUJIOEvQ-H5GjGfPwYV5_QufuD46twmNvS@mail.gmail.com> <41EF646C-8866-4070-B772-94E39EF4620B@bredband.net> <alpine.OSX.2.00.1007221056390.354@localhost> <1CC1901B-7E56-4FAF-96A4-8F2F2F5C38A9@bredband.net> <alpine.OSX.2.00.1007231358580.393@localhost>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtprelay-h32.telenor.se ([213.150.131.5]:44262 "EHLO
	smtprelay-h32.telenor.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752455Ab0GWJL1 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 23 Jul 2010 05:11:27 -0400
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-h32.telenor.se (Postfix) with ESMTP id C2B89E8F21
	for <linux-m68k@vger.kernel.org>; Fri, 23 Jul 2010 10:39:51 +0200 (CEST)
In-Reply-To: <alpine.OSX.2.00.1007231358580.393@localhost>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, zippel@linux-m68k.org

23 jul 2010 kl. 06.12 skrev Finn Thain:

> I ran this on a PowerBook 190cs:
>
> postinc: result -3.500000 (expected -3.500000), address 0xef8ddcf8  
> (expected 0xef8ddcf8)
> predec: result 1.750000 (expected 1.750000), address 0xef8ddcf0  
> (expected 0xef8ddcf0)

Thank you! It indicates that the address generation does not alter any  
registers (because the FPU emulation will do so, and we didn't see a  
duplicated change). This is a bit surprising to me, but your evidence  
cannot be refuted. Anyway, it's good to have cast light on the matter.

(And Geert can say "told you so".)
