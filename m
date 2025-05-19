Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5AA2D052
	for <linux-m68k@lists.linux-m68k.org>; Mon, 19 May 2025 06:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747636311; cv=none; b=bTFPVf8nmqO2ahtQMTJ94DmInfTcFsXqMF5hIl1+18EP6KHWO8pmMgNMjaSsCJqGyWJ4LMKm1WliGe2B6BsM1tOTEF1FEQ0/dBwasMmUErZYKiPWo3v6vg5QKW8t2ACSy6c3dfPpnFPWvsdxMleefJ4sWDxtSsM3TJ4RhauJzvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747636311; c=relaxed/simple;
	bh=BF1ovdxwQHWY/86acyml+Ji0aewU5uxZv17FrAdL/Nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HZ6US8dDqKaDB8CZUGryfHh0BbGayVTi47pd4bTeSfCPUWKccKjYb6wRMSNfn1/wJ8bettWUfPhtirHoUT64SEejrcn2BSZ8cGwcsoGHhBNXga669a72QXAjuUmUs3bH9wjSBw0RnRsG6cD+b/3RjOab5PaBbhsCDQ/oD8zGmrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lbep5J5W; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lbep5J5W"
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-6019b564d0bso3391721a12.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 18 May 2025 23:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747636308; x=1748241108; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BF1ovdxwQHWY/86acyml+Ji0aewU5uxZv17FrAdL/Nc=;
        b=Lbep5J5WbuHaxjE4op2BEYQ1W1NYCg71RvYb0uj/VMYRjGdOh7b0wBAC4sTQNHsDva
         lJbJ4h5eTNX1m+7ayFxMceIrnWZL63pKoxh0WE4kqY0Ga7xyF7RmzvpN+xeyLgOfDFZk
         MtEhp5RZi5rrJhTocAl8hLbZic5SYS08pLuvl0hBIXfdPhqPznQggFqcu87Ffi+OFyBu
         7c/UyakB2L7j7hMYkl8mh9oiWSbCmKSNMePOAnqSD+crUBHN/prpo6H8D3sRKxxXva/9
         PN/mv7HJoPL8RK5fnLce3HI1uTOpnp4ryhV6chsiZuyn+5teiazH9yjbLuc021mmoLG8
         nzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747636308; x=1748241108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BF1ovdxwQHWY/86acyml+Ji0aewU5uxZv17FrAdL/Nc=;
        b=Esq6sEU/FmKSO6uVS6wgnPU2GOGTJcdWyROGwjoDxr9ALMpjK5ixFe32T6J9kmFmzc
         oyQuuHpSmmlTUiOvzutfwHDVehLKgpKqy5LfyAxkJ4T8zlFM6PyeHOGZh6jdD2/x7/3T
         QKQURis5KF+tARtWFT3UZ70UkFYZiBRHc/i53rHcxwygY6GwpUTI6DIP5Ekh9sy7D6N0
         AyTSRQ1T3u++sniPOiLlKoL7LpbB4aYORkSvdMYentrnUKOAAQH2wpy2giLFBKn/msHK
         /I8XfYA40I4tq1UJUXlZxpuWWNvcdxHsVDE+d+A14qfbHsAcqxa/yg7kATqXevPRjfIF
         bEmA==
X-Gm-Message-State: AOJu0YzvHkCU0vnfHNMoyaNsT/IBj+SFFDIc/dQUc9iTehIf+9p1gCYt
	5erx63TVIRHnNuSOwmuNNnU77vDRXAVVepMXfWMg8zZsSSvytmLrsx+xHtYk4b4MGBVicTI5QcG
	9+hacyNnn/V0iEm1nBTjzlC+65KBLcCQ=
X-Gm-Gg: ASbGncu+L5lPXux6bSQXheq66xUF0yBeT+69i+U/Yr/o+gFiX0ndlvI8wPSAzTqyw/Z
	6EKapZh81dfFv+/nc7hnoER/zFM+J5RcGmFvYxx9GixviIyau4X1toS/t7sybGhpM1SXRz5dLUx
	oKwkBk1kLIj141e/e4ospNDNioC4uH/zR5yw==
X-Google-Smtp-Source: AGHT+IESRmn4RqUdcN4tMhYxA674kvZ/4Qlv/882CQtNwGmSIHeKn97znZffKYPCylyJNOLV+K7PjG8R0OFPcC/Fixc=
X-Received: by 2002:a05:6402:348b:b0:601:834a:e678 with SMTP id
 4fb4d7f45d1cf-601834ae764mr8593090a12.17.1747636307474; Sun, 18 May 2025
 23:31:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250518225035.227880-1-siddarthsgml@gmail.com>
In-Reply-To: <20250518225035.227880-1-siddarthsgml@gmail.com>
From: Siddarth Gundu <siddarthsgml@gmail.com>
Date: Mon, 19 May 2025 12:01:36 +0530
X-Gm-Features: AX0GCFuZmeAJjIjy_nJmuf4nTuZgAv1N47LqwJBiIudfRuPaPnH59k5gJVtM8Nw
Message-ID: <CAKWSiC6tYijmMtnmhRrq8OTivfRGu6D0y9vWbPd0g45x3yoA=w@mail.gmail.com>
Subject: Re: [PATCH v2] rbd: replace strcpy() with strscpy()
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	elder@ieee.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 4:20=E2=80=AFAM Siddarth Gundu <siddarthsgml@gmail.=
com> wrote:
>
> strcpy() is deprecated; use strscpy() instead.
>
> Both the destination and source buffer are of fixed length
> so strscpy with 2-arguments is used.
>
> Introduce a typedef for cookie array to improve code clarity.
>
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Siddarth Gundu <siddarthsgml@gmail.com>

Truly sorry for sending this to the wrong mailing list, apologies.
Please Ignore this. Sorry for my mistake.
