Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1DC3F12CB
	for <linux-m68k@vger.kernel.org>; Mon,  7 Sep 2026 09:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788773978; cv=pass; b=ltFRcGioH/rLg0bXlqvPXqgqjL1pZPCFBjgzan0aNMM9ePHDgjkwsZYHiinb5xzXobTr47w7xdAE0uXB7WeDELYBRoMYqOCvezInSx06hIb1soXR7QA1S1Ub4I94gqWEJhmNQPYmjZkS64P2E1rwO+MCjQ3w0WSgZCY+1n/Nrmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788773978; c=relaxed/simple;
	bh=dK4xgf8lo5blvAGZwohVBsdWCH+Y+Im3Vf7MWQMwGCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r/tKiNyGCrj3otHoV1VAzTBHMihufeMl6m9mO2x6YzCaKM6Y0/O1qG9/cadzcEriZy7D8/wGG+Grs/Sb62laSjuYV2GAw0GbXYdMRWGo/rlY2NVkYLaJcFrbhZSK5TVEErbqiHtJBfvqpDJlQsEGv95u8btsU0gU7Txj9uDYw5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6dk+KQ0; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6dk+KQ0"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66d29b298a4so1107837d50.1
        for <linux-m68k@vger.kernel.org>; Mon, 07 Sep 2026 02:39:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788773975; cv=none;
        d=google.com; s=arc-20260327;
        b=sMNs1za/4qTvdjO/lQZQEML5AqNkK1+F6BBgt2zk+mGxDBPaw3/x+swWrgCMg7WjbR
         T9QH6qQFqceQ4wjkUL6I+kc2Ey8+e9h2hy0jnVMV/HlfuYm9omwIKY3cRMpovMuF9ZRU
         zqv2s1cbdPokI9l6GECIXkbmXdX0+ofq1Ac4lEcoT9cCQiMpaRRnU/xNZQ6bV1aDKha7
         uSlg6YuU40SE2F185yrYTRN9CbJCIg6bTgD/2nD53R/w9uIsRVw/5Wscfg6ao7Icm0Xe
         lDacykIAadqwtzsGEYUDFZzODee5EhGoaGsD/tgnOI6kvxdwsrG81cxiMPHlNHhDvYiQ
         r/xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=poQhJL8X8eQ0cN8/mTPX5+G3FbDfOheZFDtOSLpZXEg=;
        fh=bwF37j2s3zLjJNzRsY4q/isRCTNT3Xe76SwjBp+vmFQ=;
        b=TD/reQ8U6femrpgeUrofWO8rG99Y7Y61va4zufu9zJUo16jLYz3c9iMr/0K6eq02al
         r9Z+nPAfs823PaFH+4eeBep4adK/uQRBaYkUJf71KbNa8Z0EZ5Um8dBjIJSiMjbCujV5
         t5veR3cEjaOQTmwtYlkSwhpWiYm1Y2ov2dKBNtBGXU3Il85pWYNVsaRZ6xLOmb+OlD9x
         ykOLWGkMHUC3FfQkFNOPiBynaoSP1HEr7ICC3ZVTF+pVRHI/Dd/u4o0UH+BzIpGQzQz3
         9she3B54XyWKEj8sgp/2TyYSf/osctRyqmbInnMmaxBaCN7nyg3erapDK/+6ebYTgCO1
         KUBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788773975; x=1789378775; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=poQhJL8X8eQ0cN8/mTPX5+G3FbDfOheZFDtOSLpZXEg=;
        b=H6dk+KQ0zmqTJ5u+2AhakiZb50ppi3mtEAkcbd+nhDpZGiSiRFhtw5iQYpc+uKkAko
         UsfloI7Iyj1b30+0MalkOfZ1LpRkbxNgc1Z84HWwpiIynRGGmjfaekVVxA7qZMs6E2dZ
         ZPvnDxW4qrYp0AZSNlMPbNbZmFdfTrcZlFit6uYM+5AgDxbsRXpkTPZRRScvwdnqvYwY
         FA9qOFGKDeP7OgjyNna0makKlvbgv09wC7opZ6AGKfkoIG/N28Uy81nJCs+P2khWUYIM
         Nj0OPAaL5i264GOVyGB04ffIfrTVHh/ST6jfA581uVqB+Nbcito+r43F+sSGG0xjCFeH
         k5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788773975; x=1789378775;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=poQhJL8X8eQ0cN8/mTPX5+G3FbDfOheZFDtOSLpZXEg=;
        b=F3FB31j57HukBjFLMWG7+/qMTP2vgiWALbmuKBiKU9aIBlcUnocS7lHTCyYVO8pTWZ
         YqH6QrXWdKfFFye/6t00L3LM0A1Z/cobpycso3s3Vjzd1YdhpRj3czvb/g1lQVeIBMc/
         WxyJ0cwM4pXgdLr23tr19LusfXogt2/LKBguoaS1aO+GQIu9xIRV75A6cvXw5P9E9lgE
         QOfP7KZyMSqoP1yTKzvbXpd/b7NydIcHmgP6mD++GJuYKBVh8LsBNtXaxvJFl3tzO/Dd
         QPbyjWLBrJekmXKbhztLDasnAFbZIY0RZ6QVICrLioXSWb9twnMoxGtmKqMR2zZt4Jmj
         1CDA==
X-Forwarded-Encrypted: i=1; AKwUvBxl0CckEyXZP2BzBMzGnLDymJpYwekkOXz15u6VedMCwHm3DlEjG3O26UovqBFgVKP/7DjiGlPY+H+7@vger.kernel.org
X-Gm-Message-State: AFuF++k8rG0bdMIQOAbpGKm/g1b6KyDjvtaHkCuT4qbsgPxto0mUQ2jE
	T0jLQ1Zh3SXKZJq9TtA4gHt6WjDyH6ovm206qs/HhWu+FZtoojCz3+UJgvwGLq2WKBXXSr6sI/Q
	DOFBAC/pAtdKWcIROriSYQc6BqnaJXt8=
X-Gm-Gg: AYBFou3Q1ueyyN6rtcV/pt89guHH2PolVOMB7lgEPwrnIRZMgj5JatPTgxoYB7H6vgo
	eu3txCA1gLkwrdY+woZAygv3IgE8fIEct7jpu7xR/lvaRzc7teKGCY6yeHin7WUK9nuDqoHssh8
	W+hby1rtypP8/cmRqf8vU+2p0ZPQtWbRz3jIpcBMMZ7yXTnAcWbBL+BYG+BZcu+/7ia88kx5lpw
	B3MQwlNtrsrItsAnshfT0xJOTzsehLKkv4nhTrwKR0WALCuDiX/1/3y8SFY9pV6EHpIZgavXjtT
	FSXIxA/EvKOjdpGu7PDcGZLIjrPiXasspT47AKu4dwBQtOSp8GIFUhUwK9pjf9c12EGO8C2mM3C
	+fsLcKOtRg+Fq8s0BFMjuL3gpAVSIT9wa8Og1D7CwCgwDM2pQpJHL2padecC/apistQw1Is2DHT
	3JsX/EC8CcIGQn6haJIS3jNOYECWi6p4M0hQRRLBSiDlA=
X-Received: by 2002:a53:c05c:0:10b0:66f:868b:a106 with SMTP id
 956f58d0204a3-66fb6daf633mr3194847d50.24.1788773974949; Mon, 07 Sep 2026
 02:39:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260814031745.17140-1-schmitzmic@gmail.com> <20260814031745.17140-2-schmitzmic@gmail.com>
 <CAMuHMdUDvsqT5t93-ZO413pwS3rPYPB1_uy+5iRHsii8CYTdgA@mail.gmail.com>
 <ef9e0128-6309-546a-715a-3e7eb476910e@gmail.com> <8c7863da-299f-8c77-0727-fb438467a7ba@gmail.com>
In-Reply-To: <8c7863da-299f-8c77-0727-fb438467a7ba@gmail.com>
From: =?UTF-8?B?TWlybyBLcm9ww6HEjWVr?= <miro.kropacek@gmail.com>
Date: Mon, 7 Sep 2026 19:39:18 +1000
X-Gm-Features: AcwNN1WyQipclQxtOGYtsCkb4bcF6SLgTf8pGXaErnj_uA9Ck-Bs8D9nX0NYnP0
Message-ID: <CAN5rfbQMTtcvmcgbDwhTQ-D9AGxP5yGqHc=JWbN7PPJXXKPGHg@mail.gmail.com>
Subject: Re: [PATCH 1/5] m68k: Fix atari mouse movement
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, 
	linux-input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Sun, 16 Aug 2026 at 15:04, Michael Schmitz <schmitzmic@gmail.com> wrote:
>
> Hi Geert,
>
> Am 15.08.2026 um 11:15 schrieb Michael Schmitz:
> >>> --- a/drivers/input/mouse/atarimouse.c
> >>> +++ b/drivers/input/mouse/atarimouse.c
> >>> @@ -70,9 +70,12 @@ static void atamouse_interrupt(char *buf)
> >>
> >> Alternative, you could change/restore the function's signature to take a
> >> "signed char *".
> >
> > Agreed, but without a way to test this, I'd rather wait for Miro
> > confirming that change also fixed the issue.
I have just tested it. The new version works equally well,

I have just noticed that if I enable the pointer signedness warnings, I get:

make ARCH=m68k CROSS_COMPILE=m68k-linux-gnu- KCFLAGS=-Wpointer-sign
arch/m68k/atari/atakeyb.o

arch/m68k/atari/atakeyb.c: In function 'atari_keyboard_interrupt':
arch/m68k/atari/atakeyb.c:263:82: warning: pointer targets in
passing argument 1 of 'atari_input_mouse_interrupt_hook' differ in
signedness [-Wpointer-sign]

atari_input_mouse_interrupt_hook(kb_state.buf);
arch/m68k/atari/atakeyb.c:263:82: note: expected 'signed char *' but
argument is of type 'unsigned char *'

I guess this is expected but wanted to mention it just to be on the safe side.

-- 
http://mikro.atari.org
