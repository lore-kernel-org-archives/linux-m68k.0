Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8620F1FE45A;
	Sun, 15 Feb 2026 23:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771199553; cv=none; b=BwrtB2bQb7FPhxoGQ7J9UxS61Wkalj/LKpClofzf9EJipPxiiIewlmUN+flK9cAYUPi5SNV4s9YjvAw+1KYxG9bk9DL/JdaUFh8VbtspdUsv18Nb2PWGrCSA2F8c8Ke26d8Fqx4h8XrMa8BysOXfP5wgYlbYkXnHPGNE1Gxsd1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771199553; c=relaxed/simple;
	bh=wPgqa47+U9klMi1a7z7s24ENWUKrTluJbzGHJQn20lw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=qHGAaHuvOs4EhKYkAMOtmzmjN/z23X1E6dV8w7lFWNHMrrsBKd+kLhG50mkM9o7hzYxiiuKa+RZlRhV2R1SXw1t7CRcNTL/sRIDoWmvgT7AxR3zGKd7TiNu7jELICRk9NufvezqThKGZmukIbx7/o8hfIxkak0TBqpJO19nkdko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0CE7C4CEF7;
	Sun, 15 Feb 2026 23:52:31 +0000 (UTC)
Message-ID: <37cdaebf-2365-4994-b270-272d1f7d84af@linux-m68k.org>
Date: Mon, 16 Feb 2026 09:52:28 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [git pull] m68knommu changes for v7.0
To: torvalds@linux-foundation.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, gerg@kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Linus,

Please pull the m68knommu git tree changes for v7.0.

It contains a small defconfig cleanup, more use of strscpy() over strcpy()
and a fix for unaligned memmove() specifically for original 68000 machines.

Regards
Greg




The following changes since commit 63804fed149a6750ffd28610c5c1c98cce6bd377:
   
   Linux 6.19-rc7 (2026-01-25 14:11:24 -0800)

are available in the Git repository at:
   
   git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v7.0

for you to fetch changes up to a16ac6ca46d62bcbcbd7b01be0ef03fb39530d7b:
   
   m68knommu: Replace deprecated strcpy with strscpy in init_ucsimm (2026-01-27 12:38:52 +1000)

----------------------------------------------------------------
m68knommu: updates and fixes for v7.0

. defconfig cleanup
. fix for legacy 68000 CPU memmove() of non-aligned pointers
. replace strcpy() with strscpy() for ucsimm target

----------------------------------------------------------------
Daniel Palmer (1):
       m68k: nommu: fix memmove() with differently aligned src and dest for 68000

Lukas Bulwahn (1):
       m68k: defconfig: Clean up references to non-existing configs

Thorsten Blum (1):
       m68knommu: Replace deprecated strcpy with strscpy in init_ucsimm
  
  arch/m68k/68000/ucsimm.c             |  3 ++-
  arch/m68k/configs/amcore_defconfig   |  2 --
  arch/m68k/configs/m5475evb_defconfig |  1 -
  arch/m68k/configs/stmark2_defconfig  |  1 -
  arch/m68k/lib/memmove.c              | 18 ++++++++++++++++++
  5 files changed, 20 insertions(+), 5 deletions(-)
