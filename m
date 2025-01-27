Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A7260B8A;
	Mon, 27 Jan 2025 03:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737947642; cv=none; b=Se9/jAF82N6r16zUjdisux6U6Q7rqFOHUwZ5yNwIQ4LL21+tBBbFegFP8ddHzuoy7AUOTKctCcg8vrqGK1VjBoHSLfo237oN9hksbZAJiT7pKY3lUR0rBxEiUYgRYQADDZRrWDzpYkUKL5MJIFgaPzZziaK0PZbk8UiDfG497Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737947642; c=relaxed/simple;
	bh=aW7ztAz8eEUPhBN/nCvd5ZQgAF23RrRXCNcZ+oTbBTI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=a9e8nd8L60igQeO1JyAzYono1MMNVmvyHIlOh0jq0yF5iavyR7127y0sJFKjaNXImSP+1T9xl1U2FD+9/tKTlg5BVR5DcND3mTLlIJHmE2NLOJARSiTtjPS2nD5VlbbDWo2uXQvpXnNtOERxx2LgWEbDoBgzZ/KchMOgZZE9qM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE86C4CED3;
	Mon, 27 Jan 2025 03:14:00 +0000 (UTC)
Message-ID: <61cd8e02-debb-46d5-a941-c979a4ad65c7@linux-m68k.org>
Date: Mon, 27 Jan 2025 13:13:58 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [git pull] m68knommu changes for v6.14
To: torvalds@linux-foundation.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, gerg@kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Linus,

Please pull the m68knommu git tree changes for v6.14.

Just a single fix to correct the clock rate defined for the internal timer
hardware blocks of the ColdFire 5441x family of SoC devices.

Regards
Greg





The following changes since commit 5bc55a333a2f7316b58edc7573e8e893f7acb532:

   Linux 6.13-rc7 (2025-01-12 14:37:56 -0800)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v6.14

for you to fetch changes up to a0a8306c823986c43ea58be13e8b366999a93cb2:

   m68k: coldfire: Use proper clock rate for timers (2025-01-13 08:51:07 +1000)

----------------------------------------------------------------
m68knommu: updates and fixes for v6.14

Fixes include:
. use proper clock rate for ColdFire 5441x platforms

----------------------------------------------------------------
Jean-Michel Hautbois (1):
       m68k: coldfire: Use proper clock rate for timers

  arch/m68k/coldfire/m5441x.c | 20 ++++++++++----------
  1 file changed, 10 insertions(+), 10 deletions(-)
