Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20D921CA02;
	Sun, 26 Jul 2026 13:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785072929; cv=none; b=MWvqFGTZH+wUb66BtIqXyhXe3/HjEb78PPKE5AwGEc1+W+XLLcVTbpBIEh8MMbCXQAmAlIHYYY+LG6zmsAa4nZOH6BA1m1WTAXKpfZbaE8k/OneDRRIwPKu5JaQRWM29KbRqgbb3t408vuCJ5uGwE25W9BcqAI2+qj1rjvqF48w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785072929; c=relaxed/simple;
	bh=SJqxLL/huHPWJrP95HqPJWAtpX2BisJLWqMcLE8v4Uc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=rDhots6MQBw4VkzgGl7CKPMykQNOGKfYM5Bfh76gLIoVg0+X+iGYrsnbXzSGBIvgwhYXxagNIhrYeocSVNUWAvZHB3CoeWZnDrivx6apR8XOl/zALImeXRXjJcJS4/HyL6dQLI4MQvANe3gHvpuf5Jaew1U81XuxH4Y4Axh6CyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F52E1F000E9;
	Sun, 26 Jul 2026 13:35:26 +0000 (UTC)
Message-ID: <376ae320-2b14-49bf-a296-a0cc01b93b78@linux-m68k.org>
Date: Sun, 26 Jul 2026 23:35:21 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [git pull] m68knommu more fixes for v7.2
To: torvalds@linux-foundation.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, gerg@kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Linus,

Please pull the m68knommu git tree, m68knommu-fixes-on-top-off-7.2-rc4 tag.

There is only a single commit that fixes more breakage introduced by
ColdFire IO access changes in the most recent merge window. The change
fixes an IO access call site that was missed.

Regards
Greg



The following changes since commit 1590cf0329716306e948a8fc29f1d3ee87d3989f:

   Linux 7.2-rc4 (2026-07-19 13:54:41 -0700)
     
are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-fixes-on-top-off-7.2-rc4

for you to fetch changes up to 41e116ad01d8a704883187743b52d57e11bc3ef0:
  
   m68k: coldfire: fix breakage of missed IO access update (2026-07-20 10:20:53 +1000)

----------------------------------------------------------------
m68knommu: fix on top off v7.2-rc4

. fix broken local SoC IO accesses for ColdFire

----------------------------------------------------------------
Greg Ungerer (1):
       m68k: coldfire: fix breakage of missed IO access update

  arch/m68k/coldfire/m528x.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
