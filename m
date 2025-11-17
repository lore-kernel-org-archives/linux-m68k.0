Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E682C032E
	for <linux-m68k@lists.linux-m68k.org>; Mon, 17 Nov 2025 22:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763416906; cv=none; b=XgNkPKBZX8HvI+mEy75zAwb6KOU75G6wgUD6BWpR/9StZgqR1psvZO5sCMIr3FAQdEtHgB7HSRsMmMl2NgzLbkFiiwXXNC+FCiuKIH11ik8q+IMpUo4cApWcuo+voJgMNwsssEmVHla88qs0TzTFcRmGfVMUkrO7tZav1fLffmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763416906; c=relaxed/simple;
	bh=2bIOi/LvwUSRzBe2534KinIzt735ECpVp27FOLd9DAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F+AVM2tcFJdwHx/v0OZTYKaa0X1KeOJSBFqRDdnmSPalovr9T15a1bcXqSfl09O3ZG2uQT7zcJXLAZ8amUAQoS41ZWba/FtwAG/QU009zQUHhSWSLBy4bzi/yN1IVDuEzzXVy/hv8poX9dezFrWH1N7BbYgyv3f9/DFLW6iTbJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=DWb8OW2D; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="DWb8OW2D"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-297d4ac44fbso43098435ad.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 17 Nov 2025 14:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1763416904; x=1764021704; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2bIOi/LvwUSRzBe2534KinIzt735ECpVp27FOLd9DAg=;
        b=DWb8OW2DYnS73ru4KwRxW6Flva9epCvrkjBiy6Hr1sSfLPsGYoFBzgQQR46YZ3vCuE
         L+Ipy8U72TGG8TYTtXhf1D1yqJNvyqRtQ62q8nnJCHspI6HoD+tHqzQwdIobeOt+UpMi
         la3kUtuJVxnVEUe6E3TTEs4J+OxsChYSmT1T4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763416904; x=1764021704;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bIOi/LvwUSRzBe2534KinIzt735ECpVp27FOLd9DAg=;
        b=qzgJu8a7YsgI/b3Ic6m4jMkkHx2O/dmwgSuOpXUlIS+BvklGrCU3RxG0svmbKjNu4a
         2cGRz0fQnthXkuaVtQ4SwqMEa9sY9oGL6SEeKsGYZrhBDQMJG6klqOzad/DdKpX41NuR
         KfU9pwupYKzzZy7NUMoQcv2v0cIxIUqHEN2/JbzSfeuY+lRVDKRLa0h9fzVlExFQtsp4
         9XS82DkOlxnxmVCvUegOZWlKX+zRboQLfRmiWyLJap2knTauHaLVdLdQWm46o//GCv2V
         0OygomJRzdNMduIqgQMBQsM802Q1y2Iq0W0eGhxC65L5b+Huen+W1caKaUo9pIEq5tWX
         hwQg==
X-Forwarded-Encrypted: i=1; AJvYcCXAzLW+weR8WRzP/At0JD+SEIcHVDlTtJKqjmo5FAef+sqzKmukIW+vz/L+f9BSkPxIbc/Nj5fQTVho@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyzZcVVh63y3c5NZ2kjYx+Xdbepgk6o7Vufa724SExSj3xQQIoz
	WKtR0vKWffHDmlzaxkhBAkollteREt8hUpMZeR1ZcD+03O+hNwEkXUW7WJ7ZRiG4DnKMaX62VZb
	oXC/t7HYUKFbXIV9lDTx1KIMjvuanDCPOVxC9rDb73A==
X-Gm-Gg: ASbGncvZhxT49it2g6KUOVPPUvIlIJV29HIvclLQFF0Mt/z+cWJ4dlKJDLRF7oW6U+m
	896FNUikNz3zAiB78QrEVMfiEO+06vNAFJPkUgHAW/jMIfvpkgayjcC7aw/CX6eCct9NApygEh1
	WgS8PcwlGfQkx3yqUm37t8vOF2hcPdycvp/Tm187lvQ0xJWzNSb1JnEMQH8PxSJ0iiAAEsVaErm
	IvOFcHPyWPzx9ezPF1mjeLSQVnjuKBgqGkQOBNhcwFiCSunZWodaJgdZvP0
X-Google-Smtp-Source: AGHT+IFch3NU57bq35GuAlUXnVxxFEiQB6+UicV/uL6UnblioytYTr+h13XuSNcZdrCPOw1nRckE0y4ygLCVaZNerPU=
X-Received: by 2002:a17:903:40cf:b0:266:3f63:3500 with SMTP id
 d9443c01a7336-299f55269d8mr9453895ad.12.1763416903578; Mon, 17 Nov 2025
 14:01:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251116220508.1513445-1-daniel@thingy.jp> <e5ff379e-b679-4513-b390-fa9b604999f4@kernel.org>
 <CAFr9PXkzhEEsSUXWCtpHaX6DWEKzX=xCESSpzbSFoJgf8mrz4A@mail.gmail.com> <126822f3-6f11-d02d-43f8-1b5e6bcc910a@gmail.com>
In-Reply-To: <126822f3-6f11-d02d-43f8-1b5e6bcc910a@gmail.com>
From: Daniel Palmer <daniel@thingy.jp>
Date: Tue, 18 Nov 2025 07:01:32 +0900
X-Gm-Features: AWmQ_bmbA99jJFyAqnkstt4SB7vjw5h3buxUcRhwZ7ye5Gcb6aavrYGBlM2TfXQ
Message-ID: <CAFr9PXkF4CUYUNaYQGuadAm5fCn65hMJDdGo=zwcPDaq4zOxSQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: Implement kernel memory protection
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Greg Ungerer <gerg@kernel.org>, geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michael,

On Tue, 18 Nov 2025 at 02:41, Michael Schmitz <schmitzmic@gmail.com> wrote:
>
> Daniel,
>
> take a look at arch/m68k/kernel/head.S - 030 MMU setup uses early
> termination descriptors for kernel memory, _not_ regular page tables.

Yeah, so when setting write protect on the last bit of either the text
or the rodata the end is getting rounded up to the next 256KB and
write protecting too much.
I worked that out and adding some alignment in the linker script so
that everything after the places getting write protected is pushed off
to the next 256KB does fix it but wastes some memory.
Looking at the manual for the 68030 it seems like early termination
descriptors can have a limit so I could set the alignment, fix up the
limit and then give the wasted memory back. But we are using the short
format that doesn't have the limit field.

Cheers,

Daniel
