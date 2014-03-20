From: Patrice Mandin <mandin.patrice@orange.fr>
Subject: Re: [PATCH 1/2] m68k/atari - stram: alloc ST-RAM pool even if
 kernel not in ST-RAM
Date: Thu, 20 Mar 2014 07:35:27 +0100
Message-ID: <20140320073527.ab8b054090a48c09076e6068@orange.fr>
References: <1395213784-3249-1-git-send-email-schmitz@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp01.smtpout.orange.fr ([80.12.242.123]:29129 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750826AbaCTGfc (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 20 Mar 2014 02:35:32 -0400
In-Reply-To: <1395213784-3249-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: debian-68k@lists.debian.org

Hello,

I confirm there is a problem with stram/fastram usage. On my Falcon
+CT60, whenever I tried to run kernel from FastRam, nothing was
displayed on screen. The system was running because I could use it
through serial console, and see that everything was OK.

Of course, running the kernel from FastRam is much faster than running
it from STRam (something like 4x faster), so fixing this issue would be
very useful.

-- 
Patrice Mandin
WWW: http://pmandin.atari.org/
