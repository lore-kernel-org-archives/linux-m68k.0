Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978CD1FDE1A
	for <linux-m68k@lists.linux-m68k.org>; Tue,  4 Mar 2025 10:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741085039; cv=none; b=huK85s7u+llOfETzkABhy8x217dgw/CDqztFPmoMBvkmR2ppcBCRwZ9nHrnKCQGINSLV37/6y41USq2wIpdT7dTvShySfWnnbh9TS5IEfkd87vA9YWUypfZ9XHVcG6hXM0aE8f2Y1YlxvqX3V/XahAxEc0VjHYKY6fzanRg1jR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741085039; c=relaxed/simple;
	bh=amQpJWz961G9i8FxpA0xFOpFzhTcMDLimCTtZwpNAk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FWhQCDuLj3hqwFjhxdiWVeNYXSGlfQe2MRDcZslALrI79+daasueXsBpPxkTQUdQbpqDTKl/jNHYBAeN8OyzMIamDxJio1t9p7R7umKjtN5f7Rb2F1uFzoDr5pYjrJeZIbPAmbqeETIijoSTCEvbLkc+LKq9/ISi6gJXHx7u+Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=g/ywtzK8; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="g/ywtzK8"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22328dca22fso81192065ad.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 04 Mar 2025 02:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1741085036; x=1741689836; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=amQpJWz961G9i8FxpA0xFOpFzhTcMDLimCTtZwpNAk8=;
        b=g/ywtzK8PaJq2lm+ZKwCx28uHl0dLu9CwXsxMvM8J1RxIs1APKUwaMQjw6dOkQhgMl
         ZYL7MsEOZZZENMIBOGR9lEmL3iiSczhuK1J3HmAf54W7SKvjt68+JjYJHIq7K/izr6l7
         L3twONByZKnwXwHykd2Szx8hO0XVX07/Kv7mY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741085036; x=1741689836;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=amQpJWz961G9i8FxpA0xFOpFzhTcMDLimCTtZwpNAk8=;
        b=U0UvRGxlvtd8ghMFCLPab2oaqXa4i5RGdRnBpc8d8auOUfGO21bKtsYbB1us5G5lV6
         Z2yFTcwP99htKnENwk3NdImuoEMQQ+UiLOqBkyraziEzerjweFtTlqtQixTE5B4ytjfm
         G9UZ6/Usab9i08T/KX3WY0CVMVk999koblN/pVu/OfOUjuUSh4IfDno+5e7R4Pw+B8OI
         ZUt8P5tGBz7KSALK7NZ/7X+FqsVgDHygPZTPs8nTJ25W4KWVTn1stj8CiYq270Of9uP0
         6AFB2BbloVi/fTwCevvIT2NixmuHgYinzTaF1UxRWsJ1ux5i0ZmwV03L4928z3ZlTKPD
         r3wg==
X-Forwarded-Encrypted: i=1; AJvYcCWkSlnmaV7O8lCXZWe0IT1ZceGW6yUHynp2wACeKiWHqF1XbwZCGo/+LlOxFu7d2bWDW3tdKivHnU3i@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwcXZw353HbTx5+AU8ftFeRCFAE1BT/7VRqxOSCpR7u3LDQzsz8
	/LC6goAdlyITWJ5ThcYWtT7KPI+OjyW/2xerRm/36I+mPN+aB2RxwtB1cZeMAN7QCw8Cq4k3phF
	TnAh8NF/MVqAT0B13cogfpzrRhp6oWLH2BX8Epg==
X-Gm-Gg: ASbGncvHI4EgQWdMf2Ui+ekMfjT5VaunV8LFGg0vaEe8194wfWwsgBT4xS9HTDrlFtm
	dws/7YxeCaoBNsK2l1EmchfeoQLm6ge1DJIFx2BnEx0zhNn/62C9ieXGaHsubXypMVYr9opAgZA
	wcyPiKP+B1wD6ZTGKJj/r2ueyny5CHrS1mbuXga+fyrV4m61dyOJ8GYRz8SPm1
X-Google-Smtp-Source: AGHT+IFO7ecXy741NtL0I6Bknif1mhVYH09bLzARVHy05PDJewQLqqW5mxJi8Ja12tOhLHjlqqbqvh81sfRC5OXcmc0=
X-Received: by 2002:a17:902:fc8d:b0:223:44dc:3f36 with SMTP id
 d9443c01a7336-2236925eef4mr279799845ad.43.1741085035767; Tue, 04 Mar 2025
 02:43:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250105071433.3943289-1-daniel@0x0f.com> <291d1541-e026-cc50-6a55-42c11c64b6eb@linux-m68k.org>
 <CAFr9PXm4kTWF27GPMNDb5=W8vZRQia418xOQDF_X1yo0vwn6hA@mail.gmail.com>
 <4eb796cc-b178-8394-0149-03600f1caaed@linux-m68k.org> <B5B5D58B-D111-431F-9701-44FCBB67D11E@gmail.com>
 <b33b072e-f44a-9450-cbe9-52300ab971a3@linux-m68k.org>
In-Reply-To: <b33b072e-f44a-9450-cbe9-52300ab971a3@linux-m68k.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Tue, 4 Mar 2025 19:43:44 +0900
X-Gm-Features: AQ5f1JpSY7K1FkOyRmqKHCL8vF9tnRQSANhYqoMuATNBZDnqfwF4WOLBi9qLGtw
Message-ID: <CAFr9PXmXsW=RqJsWPCUDvQO+vst-wSj__Fi3nuxCo7ZRAi0wOA@mail.gmail.com>
Subject: Re: Bootloaders, was Re: [RFC PATCH 0/3] m68k goes DT
To: Finn Thain <fthain@linux-m68k.org>
Cc: Josh Juran <jjuran@gmail.com>, geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Finn,

On Tue, 7 Jan 2025 at 09:57, Finn Thain <fthain@linux-m68k.org> wrote:
> Some of those bugs and missing features apply to EMILE as well. IMHO, what
> EMILE really needs is a MacOS GUI like Penguin. So my advice to
> prospective mac bootloader developers is, add a GUI to EMILE rather than
> try to maintain both packages.

FWIW I have started to move EMILE over to using meson to build (so
it's easier to build on modern systems) and fixing up some of the
issues it has with building with recent GCC.
I have it working enough to boot HEAD on a LC475 and on QEMUs Q800
machine. While the penguin ui is nice EMILE seems to work well enough
and it can be used to generate bootable CDs.
I have a setup now that can generate a bootable CD with the kernel and
a buildroot based userland that I can drop on the SD card for my
bluescsi and boot into Linux without any macos intervention.

So basically, for 68k mac I think EMILE is the way to go.

Cheers,

Daniel
