Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3987262A3
	for <linux-m68k@lists.linux-m68k.org>; Sun, 19 May 2024 13:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716125485; cv=none; b=oHU0eJcDjJJAkP7c7PwhRIaky7UrtYc5k+CbgCrdN+bPpKCodRzXjSQAXS0JJmn7BkUSM7fq0DYsHwO8hURfKtWMbB+30NYnGhSd1Bk3FT4tFho9ZHHgjFzwcSecIYlQ9dKZn898yaZ6tsayfg0X2D8MFyzMPZCL6Hjm4rAAuHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716125485; c=relaxed/simple;
	bh=1enVA43XbvPIt+NzCmxvlPWT1ezIcQDYYmtpONpf5R8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Axbj/mXnKDUCUVOR+IpexWK/WWEuhXivKGLZb98DAQwiWrOKWhiWtjXRuuHQdWFV9RLdv0RgUiD8xgwn/hBbUk51kTDHjUD4/V2FTholpdY6vV1+ma6ELfsVK3J9ziT/e5xksbwu5vuTWb0t2qGK1PuMfV3BRqILKPeJ4AmeqAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-61be4b9869dso16941517b3.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 19 May 2024 06:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716125481; x=1716730281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Krzfz5x5lFqXM8VwEzpab6mEMZ8GG/CziPs0BAUbVXc=;
        b=eOsdJAjEdR379dkWvmRGtoiarN04CVv9deUo8VTxw1Naprzl6OJh01mdMyn236P4CW
         hO9cu6T/Qx9OMJdRBGYtLurOP88Cfu2HnE7656BhhGmR8DXpOlAR7w3rpudJUCIHVJsc
         pRY4VLgG8KfHPiEW+KFJOfZedNOueKjVoVrHRifnjFgNzrD671yT+1s47R+x9t8sYfAa
         uuBj1BU4XCi2aTJEmQibUmyEso2H3ZX3Bg9n7YSUBr6eIqI7XImEf4El1xj+eZL8ZXCf
         iDqR/pIne8UE6sw9HXqMhfq+SfxyO8aUXjYQZbAGh4sW5f+LXIH1ydd1NHJe06cFV1O9
         j8Dw==
X-Forwarded-Encrypted: i=1; AJvYcCXUtSLsA8llphWRdjNVnrYtXavsmZr2L4cgp/Krl7BhbAqj9AALgMnieRbAO0FLXHQkPdBjgKWKq6KDJoohgOKXxqdPS9orx/BiXuq2mLMo
X-Gm-Message-State: AOJu0Yyx8PL2aDH8+fc1fpzzBkD4NHWPWsqiIOcG51Jo4SGshH2Ntk7z
	+PYC3Ox7u1TfzYmNo19ykCrKnm+SbUeVc+aG7ZubWcsfqfa1APd8LYhLxl4j
X-Google-Smtp-Source: AGHT+IGoVHgwlxa2n0wBZ09xAN6j2EBg5wIzfTTlRJ42Vbz8uiD1ctHwd9p1fyv6W8wPoeG/qT0EiQ==
X-Received: by 2002:a05:690c:60c1:b0:61b:92d9:f7e8 with SMTP id 00721157ae682-622affc09ebmr335995867b3.23.1716125481106;
        Sun, 19 May 2024 06:31:21 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e379112sm45716587b3.107.2024.05.19.06.31.20
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 May 2024 06:31:20 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-61bed738438so15706237b3.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 19 May 2024 06:31:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXrufiXObWf4cqH9HAuhuX42CJzJKkls/nIaLRLeAXrpZYa9lS1N5ecO50Ys1qUXnNauxVe20bs7Udw6UNRZtoYfLoNEFEXoRrh+YvPKuUq
X-Received: by 2002:a05:690c:6408:b0:618:8a27:6150 with SMTP id
 00721157ae682-622affc0e4cmr292230657b3.24.1716125480463; Sun, 19 May 2024
 06:31:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZkjwzVwYeQtyAPrL@amaterasu.local> <e9d97c04-73c2-e6dd-6d51-b9a4e3ef73b2@gmail.com>
 <Zkn9lwawFGzSJFSF@amaterasu.local>
In-Reply-To: <Zkn9lwawFGzSJFSF@amaterasu.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 19 May 2024 15:31:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXa4BFYGSAfoPHP7hntFh2rKmFXx0p44vxua1KsfuHR1w@mail.gmail.com>
Message-ID: <CAMuHMdXa4BFYGSAfoPHP7hntFh2rKmFXx0p44vxua1KsfuHR1w@mail.gmail.com>
Subject: Re: Amiga, serial and SYSRQ
To: Paolo Pisati <p.pisati@gmail.com>
Cc: Michael Schmitz <schmitzmic@gmail.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

On Sun, May 19, 2024 at 3:27=E2=80=AFPM Paolo Pisati <p.pisati@gmail.com> w=
rote:
> On Sun, May 19, 2024 at 07:36:43PM +1200, Michael Schmitz wrote:
> > Paolo,
> >
> > please try adding 'initcall_debug' to the kernel command line.
>
> I'm afraid that won't work - init/main.c:
>
> bool initcall_debug;
> core_param(initcall_debug, initcall_debug, bool, 0644);
>
> #ifdef TRACEPOINTS_ENABLED
> static void __init initcall_debug_enable(void);
> #else
> static inline void initcall_debug_enable(void)
> {
> }
> #endif

That's just a forward declaration for part of the initcall_debug
support.

> and TRACING_SUPPORT:
> ...
> depends on TRACE_IRQFLAGS_SUPPORT
> depends on STACKTRACE_SUPPORT
> ...
>
> which are both missing on m68k, IIUIC.

Without TRACEPOINTS_ENABLED, you get:

    #ifdef TRACEPOINTS_ENABLED
    ...
    #else
    static inline void do_trace_initcall_start(initcall_t fn)
    {
            if (!initcall_debug)
                    return;
            trace_initcall_start_cb(&initcall_calltime, fn);
    }
    static inline void do_trace_initcall_finish(initcall_t fn, int ret)
    {
            if (!initcall_debug)
                    return;
            trace_initcall_finish_cb(&initcall_calltime, fn, ret);
    }
    #endif /* !TRACEPOINTS_ENABLED */

That second part should still work fine.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
