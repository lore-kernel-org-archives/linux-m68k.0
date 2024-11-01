Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9519618453C
	for <linux-m68k@lists.linux-m68k.org>; Fri,  1 Nov 2024 23:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730504153; cv=none; b=Ki7EdMlQ8i4Ly1XRc28Lbly3UB33lcXht4FTtBcrxmxC7E2BxlJSISI8x6mhA/SrJzBqxlto5dHv9j5BOVIX3UPn3zkQtbtP9NnfnR2ELWsD/1/Jsu5xfcfJp6V0R8Dqx+4ZOS/i1I9FdpwN9rOJE4ae9AZ98YSP/xjGTD7MkSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730504153; c=relaxed/simple;
	bh=Ue885HcxmPf0L8ARa1j6S9W4nBVkiVf0INutQUO3kS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KJlcFTx/jeiO8V+8hTmUi9YbEJbvTXwtKp51t3KaRTh4QesHrxYIZYsBINAr1yVZtbY3rgTK3hl2mUkyfq1ThKleK3C4lK6DCZBgWDXnodkL3ZQbPl/LXvsMxEExWevLbYiixquiuHVq7PFLhYBj3sHsCmjnnIDJPtPtDxxAlLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=uWkSI24/; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="uWkSI24/"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7ee4c57b037so1442431a12.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 01 Nov 2024 16:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1730504150; x=1731108950; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ue885HcxmPf0L8ARa1j6S9W4nBVkiVf0INutQUO3kS4=;
        b=uWkSI24//DP48tR5S7f/0O5vlXNTVynAEYiBwKBdlstFCKPu6HEX1gsg+XbRhxg5MK
         XtCL2+rGaJJ9T87jX9++XK8GiiTnNRRjsOBploHRU5SMMjymfZY20j9d0ak9UzQSOucK
         IhHFFGRo1WHddOna0Bt4Rs5WpvUDQvXGLZEtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730504150; x=1731108950;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ue885HcxmPf0L8ARa1j6S9W4nBVkiVf0INutQUO3kS4=;
        b=Qm8srRtilrn+PbInqwKoO9VaCYXaRV9Ii1iZQgAF3d+tk/HDjUa1rG9CZFp7iwXyTz
         8XJFpt1X8HdAR2SRTHz4i122mgm06YkCVMDm8IFZ3gmQjocmhxpN1+E4BsJ9wGeaFcYe
         iCajqLot+5QYbHcD7p2huUFS+GxXOBZEcKnUfZns6XNxWADUeRQaFukTPAxITRcOZbtT
         OwHCjBH+F8BpWtup/Bmz+qWsNomaTS/TgTUx+ZEnp7I46it22TQj5HiRsVzSy6rB19aj
         JIY918kli7Hcklj1NQe7rJsdFuzNB7m51G3vEf+lvtCW5WoEUzbARQsE9yQYrWuYqR8r
         wZCA==
X-Forwarded-Encrypted: i=1; AJvYcCV5uGHLJ2alqC1Z0+sO4RME5x87Bohe6TYlXej0LYvC05ES8TsLdaSSXg+v3/35Uz2/Fbam2cJG72+K@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzftDAsTfaEBp8CveId2vzvJeai6Mz3aRcKYaqk9FPtR0/TfwvO
	6UdSkb2GPjukKQBewYgDJ7MYs67vAFjidMxM77S2RY0gNaoXHS1pU4C9j8s0fVsRcO0sJAD9Jt3
	mAsn0OzwJx2VLMZLfWb/uevd0vjxC/7+HP13DGg==
X-Google-Smtp-Source: AGHT+IGSCCGc2XOfqTuOFo5khzBYSCD3q/i/ZhvzprTRm0qV62b3/sKYvu1Q2BKXYbheXAm5J0pQa/GsCtf+WDDJFOU=
X-Received: by 2002:a17:90b:5306:b0:2e2:c15f:1ffe with SMTP id
 98e67ed59e1d1-2e94bdf49acmr7314138a91.0.1730504150505; Fri, 01 Nov 2024
 16:35:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0e7636a21a0274eea35bfd5d874459d5078e97cc.1727926187.git.fthain@linux-m68k.org>
In-Reply-To: <0e7636a21a0274eea35bfd5d874459d5078e97cc.1727926187.git.fthain@linux-m68k.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 2 Nov 2024 08:35:39 +0900
Message-ID: <CAFr9PXn8Wi8btubVXKTNNQQyQRtvWaYV5aHyvvQLypJYp5i=9A@mail.gmail.com>
Subject: Re: [PATCH] m68k: mvme147: Fix SCSI controller IRQ numbers
To: Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, stable@kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

On Thu, 3 Oct 2024 at 12:32, Finn Thain <fthain@linux-m68k.org> wrote:
>
> From: Daniel Palmer <daniel@0x0f.com>
>
> Sometime long ago the m68k IRQ code was refactored and the interrupt
> numbers for SCSI controller on this board ended up wrong, and it hasn't
> worked since.
>
> The PCC adds 0x40 to the vector for its interrupts so they end up in
> the user interrupt range. Hence, the kernel number should be the kernel
> offset for user interrupt range + the PCC interrupt number.
>
> Cc: Daniel Palmer <daniel@0x0f.com>
> Cc: stable@kernel.org
> Fixes: 200a3d352cd5 ("[PATCH] m68k: convert VME irq code")
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> Reviewed-by: Finn Thain <fthain@linux-m68k.org>
> ---

The other part of this that fixes the SCSI driver itself is now merged
and backported to stable branches so it'd be nice to get this merged
too.

Thanks,

Daniel
