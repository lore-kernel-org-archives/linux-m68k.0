From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: Re: [PATCH] m68k: fix find_next bitops
Date: Thu, 31 Mar 2011 15:02:43 +0900
Message-ID: <AANLkTimuDf+Qo0e_sVuNX5DavOBSu+Gr-VryeD9aSw_9@mail.gmail.com>
References: <1301050810-11329-1-git-send-email-akinobu.mita@gmail.com>
	<AANLkTikKA2MY6nf+LLyJbNQffX=qYY3eZdpNmwVQc21u@mail.gmail.com>
	<m2sju4jrov.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:33533 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751019Ab1CaGCo (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 31 Mar 2011 02:02:44 -0400
In-Reply-To: <m2sju4jrov.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org, Michael Schmitz <schmitzmic@googlemail.com>

2011/3/31 Andreas Schwab <schwab@linux-m68k.org>:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>
>> Andreas, do you think it's worth keeping (and fixing) the m68k "optimized"
>> versions?
>
> Should be easy to add the required offset >= size checks.

OK, I'll try to fix the optimized version.
Or, could someone who can test on the real hardware fix this problem?
