Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4243E38759C
	for <linux-m68k@lists.linux-m68k.org>; Sat,  9 May 2026 10:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778321013; cv=pass; b=GDBAK/RVJGENvBfW8qQmztjbPzeRpQJGCccNxHM/GMYZkgQEl+E5CBTHqSnlFnuRLhAUJ4ezyv2G8CKivjqxM/9Nz1/sejZmTgyuLGKUuLSzWriCnhfr+gdOxHP4KcGnYDLCGggbkDOU5Hhl5s7DwqUrY1MI7rPKNbTI/y2ALS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778321013; c=relaxed/simple;
	bh=LyfF0UgOqxJDyWr63b4yPScMJnB6ZcMUY+e4AyvMA1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W0V3CY5S452ZvVOv3aJ7qBAkkoKY6385ZyqXEspi+V0kGmikmY2WjvBP1ycFtZGynf1C3mot8P7wxGUmy7W/QCsrSbTXuWX+LmPaaRknFjbbJ77qcKtnZv5q3V04dLseuSS8u1VwEGKF2kfToDiasd/DCinjr9lTXol1OIxhlrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=oUISE9ZQ; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="oUISE9ZQ"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12c45281a06so4808832c88.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 09 May 2026 03:03:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778321010; cv=none;
        d=google.com; s=arc-20240605;
        b=Y44nE0/nRhhm84uoLwgvJrds7PNQesX3uW6TjbK2GUJZfz7TxoIXjnTCjTiNaipnNd
         Z5G04Wgrft1HDGprSBqV2NXKO2PdqyJTjvpilgnBXaT8ycyAPdhlZZX6t5WYmGxAtju0
         YG1pfYyL6+8rjp6IFFZUBSoOjCFUPHC7nPGckNBeP2D1wALAD9Bw1ET4fqFxiYuSvuPC
         VoPFq2vCZdLI5b+eXkzeP6a5z6jRVZ7XOL+86xixZJAnHk45W131IROkQjypU5Eh2ty1
         3nZTRiJA22YyQqF/KpSANpXTZgb3oSrTpatpunT1K8MK5DR8xsolvtfdpTnquANMMTYg
         9xkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LyfF0UgOqxJDyWr63b4yPScMJnB6ZcMUY+e4AyvMA1w=;
        fh=64BbPmHw8EY0p6WJ6aGZGB+nEwsd6BX3x1+ARS8k+wc=;
        b=YHED6KkpxB5vbD9V2xFGtLrs13YJeoYD0gxBO3TWuD703s89F3/lzp3PirRYhcbN7X
         PtiHBsUZWbXWZ1C7CsHEk5XNjvVEESYBUUU2Gt/PorF7cM+EwG9iudgZn/tFkAOJ/Rli
         2LgweBtDa1SBuQiJVYZJQEIKuJQny/e+Rrf4mVidyG/CtjpbJDzFpThTnf7gHCWmf5Nz
         BS81oWprKBHdmNmd5w/lZRXRXhbKBd5GJFZ6TOBvUsLGkYKy2PH2KrgmdsCg4rhY7LAn
         f3gmii5EeW+S9G1WGZQgDb3LlE2cIcZPayMTZhhv8N/UZV2me8iUyWyOlm3Ln2Vt5rTq
         LX5Q==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1778321010; x=1778925810; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LyfF0UgOqxJDyWr63b4yPScMJnB6ZcMUY+e4AyvMA1w=;
        b=oUISE9ZQkhB8q3Y/Zzbzis8+ty08cn0KXGFO/zyOWCvUFjZpVGVWEglK62+4rfqTdM
         1q6XbpkckNE/mEM2wSZJuRkQhjNveltvE80JyMdwCS86KzKHHC+p4wYZYgFtEKlXgJ+w
         vcO9BwUOy8deJJ+7pxpfKHVn+zBcIp3ZxvUBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778321010; x=1778925810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LyfF0UgOqxJDyWr63b4yPScMJnB6ZcMUY+e4AyvMA1w=;
        b=HXhq3dqGWOV7nH4HzVh83t3vu/dNc1JoZZj/mVbL8eUXZQ86I7q/DGhr358ccIEijD
         ja3sM40qRK3xxDDDd0I1xV2SaDZGDaIZiqZak3vKxb7EsenS1b+T9AiFJGBDKK0FwznT
         Jj6JCYS0LVjHS3Tggrbf5hojto34E7lUX2hrG60pqIhKnFyynGN7i0yHEt+6QgjwAwIg
         +GfGgxxtyQMnRY3H4t+N0Tb7SalSTHoN2QsSaJEv35BQDyJmWboVWl+/ZJsm8Aw9FYK3
         LYurG2epAT+OrQpev6URxc6BtWo/qJIw5IYQ3sFXYKr5oyzG/yqrS0l5ZauUQ34mr69K
         gbqA==
X-Forwarded-Encrypted: i=1; AFNElJ/OIMNNHCIhzgt1sIWPKMV1is8sz49CMoyJctuJ2C9aLeZR7NCpji6yhoiq5/MwyW1lCkKQrWkDYKtB@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzITjAnuA50zXUHGO3d2iCXD61MZ+mTyWyqIOOk+Q0UYVTwmC61
	InfqOXsHwx1u0ZRz+JmGC7hzvGM1i6rSDQGHhLycw9EEHDVWPfP1Hu5f4DKydbiBj45i4dsIe8N
	43WBHeIRLs/mQ5z75SIj7a1/6hgEReFoecQQwTKk37A==
X-Gm-Gg: Acq92OFYqmZPzBigz2VAutdF8rxe9tkX+KnloG2WxLxuDJpxxryOSSmJTYEk/mlZCIg
	RYHDoC3mR359E1zdOXc0gVlmjvv2gLEPDuhItwWjtsB16O6x554nw93Z7XRqBUDv1HoBbXwqZ91
	ePdPdLhayJ4EqDuf0cQswMawk9CvHiTmqJIQO2S0CXRfSmcotv6jtysNY4R/IIHWCZ3DLPj5jFm
	La1Ag7+z0jKcAC87IFWzKuToNQqft9+N35km1wXENTonoJQxhcmhwZQZJ63yrQWxSdmVF8c0PTp
	zB+3J6OY/Q==
X-Received: by 2002:a05:7022:52b:b0:128:d752:e074 with SMTP id
 a92af1059eb24-1317d8939f7mr8343391c88.1.1778321010065; Sat, 09 May 2026
 03:03:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1ed9c4c753395510c1a8df9c35e2ad4c31c90f95.1714265926.git.fthain@linux-m68k.org>
 <fb2ca693-1f99-2c5a-7ff0-9bcf22f89de0@linux-m68k.org>
In-Reply-To: <fb2ca693-1f99-2c5a-7ff0-9bcf22f89de0@linux-m68k.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 9 May 2026 19:03:18 +0900
X-Gm-Features: AVHnY4LhoKg88HI2Tfy7uNObTSjK_JnEFeiD_RwXtpj4cUYWf9VQFj5VXJy6a9I
Message-ID: <CAFr9PX=V-Hw2yCw8x=++n8KA5Vbd=ZeFpFwJ6j_hJmRgHcpaeA@mail.gmail.com>
Subject: Re: [PATCH] m68k: Handle put_user() faults more carefully
To: Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Michael Schmitz <schmitzmic@gmail.com>, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Finn,

On Mon, 4 May 2026 at 18:07, Finn Thain <fthain@linux-m68k.org> wrote:
> >
> > So far this has only been tested on Motorola 68030 and 68040 systems
> > and still needs testing on the other MMU-enabled processors.

Would testing on an 060 amiga be helpful? I just need to run the
stress-ng --sysbadaddr -1 thing before and after and collect the logs?

Cheers,

Daniel
