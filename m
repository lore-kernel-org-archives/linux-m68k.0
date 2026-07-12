Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB6F1A724C;
	Sun, 12 Jul 2026 12:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783860389; cv=none; b=cS2tEOQOyx73JHQ8zIfkedlbRlCRzvXPmIJTwTq33uFpPMi/hz1Xt6bqRBWbujjs62NvpvSWv5x5t4ddjLFz1Vzgg+gXtAZs6bEMVEnaYDBX4+RQQe+b1NPViD8nEy1B6oH4mUFn6MBeY1wMyAKK/c65D9r0RBJnEBz5KaenrA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783860389; c=relaxed/simple;
	bh=11scZVAtD3nVc8wqCbk7rV3YDqxOBSnNYPDl5+/JdKU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=BrW47GI+HtxeR+bA5WA3rqXh+Q8MET0O7OoLVTJm6FCaVFuUAkgSjDcbSuTOclBKRs92iHgl3KJpDNvlSLjZ0W0Q+nvUZ9AmUMFQYFNDjL0YmgSjJ510G8mW+Z5vJqnwqtKs1bDLrfiTYpfRZ0v1CNpdKRfugwWSOwbV8TrEvFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFF6A1F000E9;
	Sun, 12 Jul 2026 12:46:26 +0000 (UTC)
Message-ID: <608d7d1f-8e13-45fc-9546-2b2bd69707e7@linux-m68k.org>
Date: Sun, 12 Jul 2026 22:46:24 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [git pull] m68knommu fixes for v7.2
To: torvalds@linux-foundation.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, gerg@kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Linus,

Please pull the m68knommu git tree, m68knommu-fixes-on-top-off-7.2-rc2 tag.

There is only a single commit that fixes breakage introduced by changes
in the most recent merge window. The change fixes incorrectly updated
local SoC IO access function names. Testing didn't pick them up because
there was no specific defconfig for these particular SoC parts. New
defconfigs will be introduced in next merge cycle to remedy that.

Regards
Greg



The following changes since commit 8cdeaa50eae8dad34885515f62559ee83e7e8dda:
   
   Linux 7.2-rc2 (2026-07-05 14:44:06 -1000)

are available in the Git repository at:
   
   git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-fixes-on-top-off-7.2-rc2

for you to fetch changes up to f47b6b313df9a17010a72b3f389f0a5e9e49db3b:
   
   m68k: coldfire: fix breakage of missed IO access updates (2026-07-08 22:51:54 +1000)

----------------------------------------------------------------
m68knommu: fix on top off v7.2-rc2

. fix broken local SoC IO accesses

----------------------------------------------------------------
Greg Ungerer (1):
       m68k: coldfire: fix breakage of missed IO access updates
  
  arch/m68k/coldfire/m523x.c | 2 +-
  arch/m68k/coldfire/m528x.c | 6 +++---
  2 files changed, 4 insertions(+), 4 deletions(-)
