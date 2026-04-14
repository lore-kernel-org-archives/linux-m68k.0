Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39ED2765C4;
	Tue, 14 Apr 2026 23:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776209913; cv=none; b=Oh2Py8x/QqHo+/F4x1320cCLNjixhkDkT9wD7OKreW+ZYoVOtenuNars1XPZjXmIqPqbQDa8cflP9HVtDpTt2OSXvE0ugcWNZr3vxCx+efwhI66RCKygPO9k+BTHQNen7EuNSjhk6TqNKDfVGvK5Sp0UCkYr2ATDaK74MyoOT3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776209913; c=relaxed/simple;
	bh=4cnjDUFAlJnHlhb9oyk1oVWXfxJ7kF38q/i87GWfKoo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=qJ2yW8XtJiyGGRaWur+F4ym2cg/mhaF887C3WAFZIC9A+BNvLVGqsE7bkdYu4p8mOof3U52VcmakijkhCKAbh0fwS8bBqnwQWcQJUxEmWiKb2eP1+ur/0MAG18rHJlETgTelAxeDeOCDkqhEOKhQvv0u8J/wmDVNuNpgqpeP/OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 506C0C19425;
	Tue, 14 Apr 2026 23:38:32 +0000 (UTC)
Message-ID: <d98c3944-5739-4eb6-ab89-8eae46343634@linux-m68k.org>
Date: Wed, 15 Apr 2026 09:38:28 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [git pull] m68knommu changes for v7.1
To: torvalds@linux-foundation.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, gerg@kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hi Linus,

Please pull the m68knommu git tree changes for v7.1.

It contains a fix for broken task info flag checking on system call
handling exit. This only affected traditional 68000 nommu targets.

Regards
Greg




The following changes since commit 591cd656a1bf5ea94a222af5ef2ee76df029c1d2:
   
   Linux 7.0-rc7 (2026-04-05 15:26:23 -0700)

are available in the Git repository at:
   
   git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v7.1

for you to fetch changes up to 2c6805145e1605cef39459f78979f7edee251b41:
   
   m68k: Fix task info flags handling for 68000 (2026-04-06 08:46:14 +1000)

----------------------------------------------------------------
m68knommu: updates and fixes for v7.1

. fix task info flags handling for 68000 nommu

----------------------------------------------------------------
Daniel Palmer (1):
       m68k: Fix task info flags handling for 68000
  
  arch/m68k/68000/entry.S | 21 +++++++++++++--------
  1 file changed, 13 insertions(+), 8 deletions(-)
