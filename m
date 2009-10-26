From: Maxim Kuvyrkov <maxim@codesourcery.com>
Subject: Re: [PATCH] Fix m68k's asm/swab.h for ColdFire
Date: Mon, 26 Oct 2009 17:56:16 +0300
Message-ID: <4AE5B890.1040604@codesourcery.com>
References: <4AC5C4B4.4010004@codesourcery.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.codesourcery.com ([38.113.113.100]:37355 "EHLO
	mail.codesourcery.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752009AbZJZO4U (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 26 Oct 2009 10:56:20 -0400
In-Reply-To: <4AC5C4B4.4010004@codesourcery.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Maxim Kuvyrkov wrote:
> This is a resubmit of the last portion of this patch 
> (http://marc.info/?l=linux-m68k&m=123324772614580&w=2) that didn't make 
> it into the sources.
> 
> Merging of uClinux and Linux headers brought in the code from the 
> uClinux version, but the condition in the #elif was set wrong.
> 
> This patch fixes the #elif condition.

Ping.

This patch is quite simple and it fixes build failures of a number of 
userspace packages.

-- 
Maxim Kuvyrkov
CodeSourcery
maxim@codesourcery.com
(650) 331-3385 x724
