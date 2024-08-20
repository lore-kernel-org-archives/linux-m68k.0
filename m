Received: from welho-filter4.welho.com (welho-filter4b.welho.com [83.102.41.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A5486AFA
	for <linux-m68k@lists.linux-m68k.org>; Tue, 20 Aug 2024 22:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.102.41.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724191227; cv=none; b=RIaapO98uGIc1xuXyztvlJe+4h1jNk3CJRCsAgMpaYrrS4rTBuUVhCHYCvOv/h1BlyL4q/wkGtOiXqdgk3GRSytrlNMjdlSGcZNsV4JAg510YQmfOfoKZvqr0j98PT7/b8qM2a1kMkvPR1sQH33mPqykXC3jPGS+8Dk/IrHm22s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724191227; c=relaxed/simple;
	bh=lzhWy+lmhyPW+JFE7m9HjkmP+6Vg9z1BXQ9YO+0hvsY=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=g/ZLnwmfymZX6ngbIgZmzp0JUP1AJVfWzR9Zct1XpQP8xj1M+7K71Z/yZcdqlDIdSm9hFJh9Cg5x2QwpO/7v3D3MP52hRIW4jm3/GgZeEbpc3h8Zf+5fByJLYwmh6nRT/WuRJc8ejSoCt4tefmlrQHTXZW50a19tmyyvX5VjsAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=helsinkinet.fi; spf=pass smtp.mailfrom=helsinkinet.fi; arc=none smtp.client-ip=83.102.41.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=helsinkinet.fi
Received: from localhost (localhost [127.0.0.1])
	by welho-filter4.welho.com (Postfix) with ESMTP id 2426A67BC1
	for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Aug 2024 00:50:56 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at pp.htv.fi
Received: from welho-smtp2.welho.com ([IPv6:::ffff:83.102.41.85])
	by localhost (welho-filter4.welho.com [::ffff:83.102.41.26]) (amavisd-new, port 10024)
	with ESMTP id utID7f0ohQ0v for <linux-m68k@lists.linux-m68k.org>;
	Wed, 21 Aug 2024 00:50:52 +0300 (EEST)
Received: from [192.168.101.100] (87-92-206-246.rev.dnainternet.fi [87.92.206.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by welho-smtp2.welho.com (Postfix) with ESMTPSA id 3A0B172
	for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Aug 2024 00:50:51 +0300 (EEST)
Message-ID: <c98e92eb-4762-48a7-be9d-23739242f0ff@helsinkinet.fi>
Date: Wed, 21 Aug 2024 00:50:51 +0300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-m68k <linux-m68k@lists.linux-m68k.org>
From: Eero Tamminen <oak@helsinkinet.fi>
Subject: Missing FPSP fixes
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I noticed (from commit logs) that Linux FPSP support:
* 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/arch/m68k/fpsp040
* 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/arch/m68k/ifpsp060

Is missing some recent fixes to bugs in original Motorola FPSP code:
* https://github.com/th-otto/fpsp/commits/master/
* https://github.com/freemint/freemint/commits/master/sys/arch/060sp

Because the fixed bugs are corner cases I've never bumped to myself (and 
my m68k asm skills are rather weak), I'm not going do anything for them.

This is just FYI in case somebody else wants to take a look...


	- Eero
