Received: from welho-filter3.welho.com (welho-filter3b.welho.com [83.102.41.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B98836B11
	for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Jun 2024 14:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.102.41.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718808584; cv=none; b=IF1gjMIXk4URS9S6Wf6j3iJCSSZ0arXTNySxyFpxkAkmSjkZ6L/N696r3MVOz0xT78tWbiAWeQmK4YbAr61D1peUeGZ1Lwng6AmzvZwN2fkaO+SIp3TWBAxUM1Bjp1LyoAWItqK5ApdavWJ8SKdzQuysTn04pPyrsakjW0mnPhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718808584; c=relaxed/simple;
	bh=/0bKKAjf/uBD/TwKI9lZhLz1UxKV7UDVUsRNkoO7z+U=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Te/CnHpS4IOZYibPUj0QAae6QwR7pr55hhLjYFDB2bzvuTItCGAhZ9C8/nxjgFqXqlMqqNitPotx5b7fKLePeG4dtYgBFVgoSDYxvcr/t29LF+iWgkjgXIDRdoaFiHou3/qEdRUCCym9pJ6AEoca9oGJyXzTqyO7Xtn3o+4KDjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=helsinkinet.fi; spf=pass smtp.mailfrom=helsinkinet.fi; arc=none smtp.client-ip=83.102.41.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=helsinkinet.fi
Received: from localhost (localhost [127.0.0.1])
	by welho-filter3.welho.com (Postfix) with ESMTP id 1A0AC1511F;
	Wed, 19 Jun 2024 17:43:39 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at pp.htv.fi
Received: from welho-smtp3.welho.com ([IPv6:::ffff:83.102.41.86])
	by localhost (welho-filter3.welho.com [::ffff:83.102.41.25]) (amavisd-new, port 10024)
	with ESMTP id xLbQEF2ER6Q5; Wed, 19 Jun 2024 17:43:38 +0300 (EEST)
Received: from [192.168.101.100] (87-92-186-10.rev.dnainternet.fi [87.92.186.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by welho-smtp3.welho.com (Postfix) with ESMTPSA id A24322309;
	Wed, 19 Jun 2024 17:43:35 +0300 (EEST)
Message-ID: <9aa793d7-82ed-4fbd-bce5-60810d8a9119@helsinkinet.fi>
Date: Wed, 19 Jun 2024 17:43:35 +0300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-m68k <linux-m68k@lists.linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Schmitz <schmitzmic@gmail.com>
From: Eero Tamminen <oak@helsinkinet.fi>
Subject: Regression: Atari SCU support
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

During the development of Atari TT / MegaSTe SCU support for Hatari 
emulator, it was noticed that m68k Linux does not properly initialize 
SCU registers / IRQ handlers on boot.

Currently Linux freezes at boot and spews "unexpected interrupt" 
messages constantly on TT.

Nicolas Pomarède and Christian Zietz investigated:
* Issue to be due to VBL IRQ handler removal [1]
* boot to succeed if either 0x00 is written to the SCU sys_mask 
(preferred), or handler is provided for VEC_INT4 [2] when SCU is used

Christian has verified the issue and its workaround on real Atari TT.


	- Eero

[1] 
https://github.com/torvalds/linux/commit/1fa0b29f3a43f9dd8080d24cd16790b15ef963f5
[2] 
https://git.tuxfamily.org/hatari/hatari.git/tree/tools/linux/0004-WA-avoid-unexpected-SCU-interrupts.patch
