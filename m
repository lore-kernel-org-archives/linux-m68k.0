Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC6B379981
	for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Jun 2026 12:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782478538; cv=pass; b=Hzc21UZhOHPBVyiV9VUIsjcX8vQIMd5SQfU4gelOUkPS5GXGwTriALbQLPNQxaBHs+qeqQKltj91S1ItSNJ2UFp72LZ1iPNrf0CX1k9i4dl+2VsTFE+1Uee4+5XJetM30AWdeZyFsRqy5CVSbgBKrY+wMNNMGFW40mwXfFNxZIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782478538; c=relaxed/simple;
	bh=Yy1syIB5Be53xOE2H3RnnIYJNaZ1+2Mcon2+1Q5ajPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VasTatfIkAqdcWn9QkNjYIb5PJ6wZG+VmbSG/wTs03r2ocri0rb/4iWbPUEsz7VhWrv0k1mLg13lHcxlSXC3DB8hodD6nU77NVX4X/HgYBoMQTneYxpa7Rn5YE/wPS3Nx5daeMnpsQ0+Kc1buDWE5zYoSxd0iDbs+G0qZmBgUco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=fDE2mQvS; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="fDE2mQvS"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-13810b63a1aso2370073c88.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Jun 2026 05:55:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782478536; cv=none;
        d=google.com; s=arc-20260327;
        b=LfuQ+1RxDIyajH5D2P/pQtSZ7T/KoudX6QihnwyesDrjsA7Yj8zlTy2EpUYoGyhRml
         proqqUbwKC5szDd+8QTdbhaN4mpV0iOYZlr13IJBZGl9WQerjNerA2QAymwRzt8UQljE
         T2YAwRN92PUd8c3ZYmsUW0+vezVY6msZmhVFuRsQOcxGr/WSrJ7n9hEAcVfeYvP9cCFi
         E3C4Sb/NobW8U8iuL6XWK2/6nQCnjGLm6YBbhDyTd2zBwLZd4hTjf4rH9a6aTos9SfUJ
         dyGzZkFqO1aRCQa2TikY7YF7lrnuAhG8eReC7GjXmfzEynYHCIxz13s+BSJRZiQM37Uu
         NsIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Yy1syIB5Be53xOE2H3RnnIYJNaZ1+2Mcon2+1Q5ajPc=;
        fh=9SeSh5NrEsst5C6zy2Br4LMYMIINPfjUy0bS/avcm0I=;
        b=sqW6jxo8aWm47MI+8+HtG9iGeD8pc3PeDn/bSPT0i6fTXqmFklVcVKCY26o5oYx/oQ
         yh6WMg4WhfFNFDuJoBnpUGVEQmqsBoqKp9V9cD3dysKjudG/apwEfwxKPT5UrZFILzd9
         kgBMnzo7qA5pzCxrfyFf161+SgY6Zsjnl9woCaZublHrqkWyGfAS+zbvGNRe8GuP8gB9
         cutRoNhqayepAb79D6OK42WHrwIf5VsUvpa6MCv9LcnKoMkicKxnaRci778kNkFIW7oP
         2k7za7zy8Dowb3nSTjnbgXWLxEZQkanpf6tzauNx2mIuAmIcgcO97lz+K6hKdOkcw8yj
         a5eA==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1782478536; x=1783083336; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yy1syIB5Be53xOE2H3RnnIYJNaZ1+2Mcon2+1Q5ajPc=;
        b=fDE2mQvS21kSXyjj6bjm8jtSUOd56pwPwis37cI1zKqMW0xdI03GsSMg7yuohi5Iwx
         7PZzlt1qJtCU3T6i40+kBZpOpGX3fFVM/Fssze4QWUYJynLZYSIevjEk7jtPWOxVM9Y8
         aE4cCSr2LBtv3TdJ4GyzyJWeyAL5Waa6gbpKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782478536; x=1783083336;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yy1syIB5Be53xOE2H3RnnIYJNaZ1+2Mcon2+1Q5ajPc=;
        b=PEQioS+A4U93SPG6Pdo0SwRvDzxL+9f76zxIkPF7d7LbcifcF3Ijbq+XxJMAjhEPW9
         tCeEiZS5Ranml/1ex9/jJKuNSCLDvhm3uC06KQOJrt1M21pyu5HoyUJ+4ahL44ov0663
         S7wkd/v4PmLnWuIIObD8b1rVH8v9+fGhmkgm2bnHFc24sGwk0w10oEaMhYPjg2YVwzUl
         yYsWk9zuf9NH3fdA03Hd6E5lTIdwAdkfx7e0XqWrCGCu8hmAFEgZBCrhjng0TUjP4lVs
         lIK+IYAizsX209sdAukAzVbDTLZdtHOg6N+eDCYmZXrq4lRRoCqwxvZH+99q3RRhoxO3
         SyMA==
X-Gm-Message-State: AOJu0Yw5HtIxcjLzdE+wv+H6vl28iujHOEI2MOa1TunOeFCLJM6r4MRT
	L5ZAsNfzyqLG05ru/OC/CmjU0/amM3oIWqybjPCLFJiDtjqETAMTODcyzB+K3c92cJsyW9MKV77
	wpfCpWG3OXyZMaVEjHFUe+TaEoIL5HGJ3z0Y28mn1/Z1znVYE0GOn
X-Gm-Gg: AfdE7cmHzqrNpsmZnFNPq5O2X1SnCFuOOYFvY7vWWa5OlJeX/oasgB3KqmoFY4ZtZnY
	beJZfBcot9McpaowmZgr6IXm81/U2my/ttNTOcfWSmvYWWPs0/2AbmV5h9bxhnYyXI4l+jdM6dV
	yMpYclImcOC1jEOg59HIxKX0Mj2fZpch5pC8IZ7JiRz8oJ7PKymVuIo0ii/QhD1NCubw+wY91QS
	80csI309WsL/DXDEDnUm1fBQRBrsRj1+WBO0qvszJjni2oqyW2BpeCV26kQrgI9kFxP10p9
X-Received: by 2002:a05:7022:671e:b0:137:eda3:e5a9 with SMTP id
 a92af1059eb24-139eb3f28c3mr322192c88.28.1782478536283; Fri, 26 Jun 2026
 05:55:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFr9PXnh7cxzLYpkxXDx9UVrxZmywmbByU386XdijAtVKECzXg@mail.gmail.com>
 <6b9f05356a9ef6460cb9358ebffd932fd151a66d.camel@physik.fu-berlin.de>
In-Reply-To: <6b9f05356a9ef6460cb9358ebffd932fd151a66d.camel@physik.fu-berlin.de>
From: Daniel Palmer <daniel@thingy.jp>
Date: Fri, 26 Jun 2026 21:55:24 +0900
X-Gm-Features: AVVi8CeqFNmG1N-_RUPNS69PG_ZYF_zwX3BgIJ8N2krjzBhGUhwIdKssB1JbP9s
Message-ID: <CAFr9PXn7DT5CvZaUrgc-JZJ5TzGt+j+SSP_iYnkSrWrOZupxvg@mail.gmail.com>
Subject: Re: m68k: 68000 port for megadrive
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, 26 Jun 2026 at 21:47, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:

> That's super cool. Would be cool to have this upstream.

I think even if I cleaned it up a lot it's a bit too far past the
acceptable level of jank for mainlining. :)
