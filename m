Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C2735CBA9
	for <linux-m68k@lists.linux-m68k.org>; Mon, 17 Nov 2025 09:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763372559; cv=none; b=CrVz4b/CEvtesKHGju7nmD4vYr0XBri79XZGUXF+LUovE6N1ZQyQ4d/y8nMZVcn2yYVS+47qJ/EudZVczS0DiXZacgRkLlr8hqDYThcju2/DJ9ayt7s9d4WcNdMX3KvGJnPs1/ZMpl1JAJCTXlnh2pgioO0JCfCKE76xkP976P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763372559; c=relaxed/simple;
	bh=wA5v1x9O7vApucCFFnp8j398XcQEEi/HshtHYCHdJ/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BIdMxJmqlkpbJWS8KWDy1nDJJeem3TCQen6qzJSBy8+qD22Vsx0BUkqVAyXbNquaj66VC7N9k8NFBzEifZ5pXSFokvwSAoAxnCbfSki1rO1aTzwgzmIJp3yxqtnpyMiKJmdiQ/t3f/VQ526Ahh1fHYNAAqYJq/70bn7o3YbLtCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=Rg6k2dpr; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="Rg6k2dpr"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-343514c7854so3499742a91.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 17 Nov 2025 01:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1763372557; x=1763977357; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rFBCI3tGEyk+ok/see0oLorqP/rcKLJbzd7I5v97J6M=;
        b=Rg6k2dpr6hdF2/GRYYnveJUwUD+H6nHXWITtnuGGEx2Wdafc6R1XunCYOY4JTzcCUV
         fmFfxMQv3yuASfGa0w2IcD6oiG8Z+ZkXoBpxnzxOU4RULwd28fdDXZvoQ460L3un1cVp
         Vct9L+7Irjs+tHY6jVNTKEVOJEgzGMq25KuU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763372557; x=1763977357;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFBCI3tGEyk+ok/see0oLorqP/rcKLJbzd7I5v97J6M=;
        b=GKjnfOnFXwaaSm+/K+5e/MwCpTlnL6sgy9BdGVlg2cY31htmUKzmztID8EIaRXhymr
         bqtEi5bxYul96WMJkIUI5KQmoQTVdyPlgz04G6UL6kd/4bt56sBIjoL72aVbhmZcYJti
         gdaYrJQoullS5oUQ0uiayGJhprfW1L2qNK7M48ItxWypUG/urj3tvTIian4DrwoiHrCL
         vLLhcniRp9cBZleMjoI0D0QZ4WlQGoKKCYyRKBVumlO03fFd/be0xXFMCHQMm2eVMfAn
         XEN2IO4jl0cG4yGOK3lroqlFHWL73z9NkNwXOfQZU1c+qTS+dQIxOVvDV2BlkewmBzNr
         8qTA==
X-Forwarded-Encrypted: i=1; AJvYcCVerqZHRk1rX7pJyhDLG2mdI8X/20R8OBTsDVPR1RuAGmSclxVhs7ixtRIvXCxqcULyY+w5W/Or9cZa@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yxx0GXBEQU6ZNe1ZojiJfXp5bsy3QSeXWCCyDHsn73Vc35tDXWN
	ynJqIXJDQ1AqyqxGIoQlVl48QApaKSgf9qyvHD1FovrCBBwW00LIKSHXNJQ0X+SliN5ZDmb7YEg
	kP7ZJf3a3XsGlO76T8JjKWK9g+6gpzogakNDWSwyueg==
X-Gm-Gg: ASbGnct9Ctnv1K/JMXg0Z0BQfZyxwHjDTEAOR7/XgcX22t8Qxz4jXVwrkxzkjE7AWqR
	EbnmzpaXgcIX8d5aI55ya0BBv91pXh4eOWqYk3NRT93X6eozn3H10OWjRC/MGg/djd61i6585O9
	lalhQrjKMw0V7LhjczjcSFtOyL+9719JX/OgLs4oJkvnFYnLUJJ6KhUCTBhWNkcdeXDFCJJYtSM
	iVuYhxtfMrAKITZYSbmr5xDExUM/I8/LVeOmSw8I6/dEPC0DYpAj27EGrNa/+W13UDmUaw=
X-Google-Smtp-Source: AGHT+IF+Th3805msSih/VHACPKFkPcuoClum0Gnc3fJ5wrACq1Jg6M2wocYHwcyf3bLI/juWBb/VOj6pl81ilDrdz1w=
X-Received: by 2002:a17:90b:2cc8:b0:343:87b3:6fbb with SMTP id
 98e67ed59e1d1-343eab27cb4mr17551781a91.8.1763372556551; Mon, 17 Nov 2025
 01:42:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251116220508.1513445-1-daniel@thingy.jp> <e5ff379e-b679-4513-b390-fa9b604999f4@kernel.org>
In-Reply-To: <e5ff379e-b679-4513-b390-fa9b604999f4@kernel.org>
From: Daniel Palmer <daniel@thingy.jp>
Date: Mon, 17 Nov 2025 18:42:25 +0900
X-Gm-Features: AWmQ_blMtb0xROGbGHh-pAgRmQzhoukSOFOqi-jr5PeTmCsyX7wqdSiJ6dvJ80w
Message-ID: <CAFr9PXkzhEEsSUXWCtpHaX6DWEKzX=xCESSpzbSFoJgf8mrz4A@mail.gmail.com>
Subject: Re: [PATCH] m68k: Implement kernel memory protection
To: Greg Ungerer <gerg@kernel.org>
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Mon, 17 Nov 2025 at 12:04, Greg Ungerer <gerg@kernel.org> wrote:
> Seems to work fine on real ColdFire hardware (tested on an M5475 -
> that is one that has an MMU):

Thanks for testing. I just tried on my MVME147 (030) and the marking
RO seems to work but it locks up starting init:

[    6.520000] devtmpfs: mounted
[    6.540000] Freeing unused kernel image (initmem) memory: 120K
[    6.550000] Write protecting kernel text: 0x2000 - 0x3676f0
[    6.560000] Write protecting kernel read-only data: 0x36a000 - 0x3be000
[    6.580000] rodata_test: all tests were successful
[    6.590000] Run /sbin/init as init process
<dead>

My 060 Amiga 4000 seems ok. So I guess some 030 mmu issue. I'll debug
and send again..

Thanks!

Daniel
