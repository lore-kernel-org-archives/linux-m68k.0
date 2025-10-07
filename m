Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BBD2D9EE7
	for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Oct 2025 11:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759836219; cv=none; b=K43XdUXPHkbEwrPGiWlfpwtiED28VenevhwJIVDe1aw/oXEbDYneukItsAlimZ6CEfQdMrbxnQDduhO/wqOfdnRKJl1GzG6BVsxfYHxfvPklQEotvAd0lIxXbATAFDsytD30SED14fdE7fyoAoWlE5ej81DXuMoCP4en8xpyJ8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759836219; c=relaxed/simple;
	bh=TpJeOnUoOLw+CN76IYU70OlkPMEo6Sx6I6bv3quU3YU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E3ovHNN22cPAPv+dnUIa4nzeUzqXpMtau/soQQ0Cq5zLpbkHiYLy3utbdXH99KKWKsHJAPnxeGaNzV8dI4hnziAE2DZdVqhvs9EGfKBR/ezKJJidwS15hMZfwGOlwLOpVDHDkeWmPVFhBTuJqZ8kTY/Bk2IgXpKEu3Fp3uyXIxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=IoSE4u78; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="IoSE4u78"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-339d7c4039aso2765614a91.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Oct 2025 04:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1759836216; x=1760441016; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TpJeOnUoOLw+CN76IYU70OlkPMEo6Sx6I6bv3quU3YU=;
        b=IoSE4u78sui1vGR4qZIwnKHeemDhiVSLeMzTuwd22nL0lNosYHq8dA5ROKoCEJMKvK
         ZtCl9f4vOFVnaa664Q4RR7B+zgcsQXwcZ6hDH+iZ8coqgqYFc3Rh5p3uKf0uNlt8NlTJ
         m7S5NWis2KluRToU0qjcxNaFyKwzdPEpSDfrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759836216; x=1760441016;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TpJeOnUoOLw+CN76IYU70OlkPMEo6Sx6I6bv3quU3YU=;
        b=cXANYL72vLUqUx0UFPrZ6QKpJHV+wRYSZhaCPNg3ePlVcrWMiMw6q/pUZNle5zHt/k
         aeEW4n3pIgLUB8aDovxK6YpxdHNq/26zBjRHOLntqS7VsgjAYQtpFnagqH+MZdGiS6Gk
         xyfu8TZpwzoiCNMFnz0F9UICDWtRB0kMqZa/1TqKWckqYnQnKdWC4t32/MBERYLwbNBX
         Q1J6Cx40ZoscLvaQsRebxhLvnx6tm/3s2zr9IFIxEWGpmFPpoQLDlNEP8NTE0nnszU4k
         KCH2wkK7OBHWt3DgUYA+lXsh50oE2RQZ5U27sNELsfHfwmMGKkIy0/MO2/WOx4AZXhdn
         c1cg==
X-Forwarded-Encrypted: i=1; AJvYcCXe2NTyeoT0ORPrCsBI+9vQDhSpFSF1riwxopN3rPXN+fLShAesQCv0BVkAehwoHqZK5yLjmTqimKwE@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yz5CKyp9RdJ5WpfVNMhltBp94PGcdXDd/Y5yV64EFP+ZStZmEiI
	W/0Ro4HKPlKss/eayBPqmpLRtEn8WFIxCeIjpLM9mDYhzUHyaJsRUvXUTj2b53Fq1jbDVCV4kxb
	T2jRv+6f/gCKC2hhHoHVvajwNQnmb0n84vjwap7vrjg==
X-Gm-Gg: ASbGncuKshWcOICcF+Yag2Z2nmykLf7CYNxUF6CJkRdp5AGob7HVQ8OY/6l3MjcxHyB
	r5zE5aLNCZWeKwJIeaHlZGggc7EPca5AP2OnIINPaJ5xT3TQZSecVAsRUN2hVuoD/zxemijTeqx
	gVSoQLSgDW3OXHqQ/xdbaambFfUzq+1YWnctLOFwK6btHywBvTb3Tok8HEkTOuzoIqXqyK75ii9
	i+qXwSBSbEMJCZNzepKCtjt1W+sXXSg
X-Google-Smtp-Source: AGHT+IESCXXn6K/T88opj7JzvSx4+eiTbjz/XV8PoT8lX1Nd43fyg5hSHU3kcLz9D/gith95LtUTey7rw9SGLXhbOqQ=
X-Received: by 2002:a17:90b:3ece:b0:330:7f80:bbd9 with SMTP id
 98e67ed59e1d1-339c27f1a18mr18415931a91.31.1759836216299; Tue, 07 Oct 2025
 04:23:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007092313.755856-1-daniel@thingy.jp> <20251007092313.755856-4-daniel@thingy.jp>
 <CAMuHMdWDfNgUUh-uU7ZFKmmAccEMqDdfDpwRXQYmwjMG6O_Trg@mail.gmail.com>
 <46382bc6cab2196a79780a946bee96dde402ae31.camel@physik.fu-berlin.de> <CAMuHMdUUAEoN+KBnk=aY6UnkxXnFp8KY0BV8qQGfGip=nNtfaQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUUAEoN+KBnk=aY6UnkxXnFp8KY0BV8qQGfGip=nNtfaQ@mail.gmail.com>
From: Daniel Palmer <daniel@thingy.jp>
Date: Tue, 7 Oct 2025 20:23:25 +0900
X-Gm-Features: AS18NWCq_eV2IvEc3GKy8N26uH_9-vQmDw1mItucWkfRV0H0wQEVAB3YqjC82L8
Message-ID: <CAFr9PXk_evnt5g1rtpbnCEXBVBeW3pCJ_8S1DFz6ynfvJcXOgA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/5] m68k: amiga: Allow PCI
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-m68k@lists.linux-m68k.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Geert, Adrian,

On Tue, 7 Oct 2025 at 19:22, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Adrian,
>
> On Tue, 7 Oct 2025 at 11:41, John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de> wrote:
> > On Tue, 2025-10-07 at 11:37 +0200, Geert Uytterhoeven wrote:
> > > On Tue, 7 Oct 2025 at 11:33, Daniel Palmer <daniel@thingy.jp> wrote:

> > Isn't this what patch 5 does?

Sorry, I guess the ordering could have been better... There is also a
reference to the Kconfig symbol added in patch 5 in one of the earlier
patches.
If this has a hope of being merged I'll fix that for the next try.

Thanks,

Daniel
