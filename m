Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7174D396D28
	for <linux-m68k@vger.kernel.org>; Mon,  2 Mar 2026 10:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772446274; cv=none; b=QQ/LxPtkPSLshmfkygf/qMA67leqrQspnPxpfr9WLiSanTo5+hJD2Q9tM5xb77JdbMPbdk27PenTPoU6ycYg0ihiN+W0en45Msmsxm2IF2z0Y3pi+Ms7+7RMeFYS58n32/fYwyGlM167vK7VtFi8cWewe/zgTHV7a+aCAra9gPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772446274; c=relaxed/simple;
	bh=w/YDD0EaAzk6t8vFqhoW2U/4CZLlQiGsRwmtkMAxALg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AhXRjK5BuOIbmQXtkN7eh5uDUf/no8XYDNnBYfM2UlKaQJ5F5ssbo7WXu/2iRekesTXfXxIhTPEdaIbUzFEX8F/6k8E78Q/Cl6Sx/j3nshwUHTJh0MEBOmkiNg6M0n3xoKu7V/fbLIgSWtQJ9ugPmnA2tPjBeNzM0Dz4Ikqz7cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5674f3e80edso4074390e0c.1
        for <linux-m68k@vger.kernel.org>; Mon, 02 Mar 2026 02:11:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772446272; x=1773051072;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tT8IVeTXpdJ3Y5yomhGu0GJUjd39P+/mPq28oabdkIA=;
        b=kYGIC74wb2a1j3aqXWwBI7IzTzuDtu/NT15dPaNfv8JqQ7v2v4XwYASlZDqx0rzu/t
         u6uuummHJdNdCwoC9p9mkeJDkzqW3CeTHwAM3yYIwssUFIspJudiVpD0W7X8NznUTeeu
         XTm7+3AlkeBFKx7elradYuyRJaFwZPX3ZlzQ7IIp3z51+JPIkaFjWq9Xdw/npz/oJgiB
         b0ln3CBWOJBvQ8jgajDSNiPsZegw6afCJQyyRbNGkp7x7Wu61hnEv/kY8CRIYuYLYPgj
         ItegL062XSCbiAq/XR2QLcAcACbBcmo+sjSGVSl1mZBQJNrkiTD4j3M6uUS8DDFfmljP
         lT8g==
X-Forwarded-Encrypted: i=1; AJvYcCVrGGrno3yu/8EzvhZfqVfyA6IOcp/qGI4lNqoGIC/fTPxfUj8qlnclKQ6jw84FAGJJqc5p27G85sn0@vger.kernel.org
X-Gm-Message-State: AOJu0YykdaJm4/0MOIjAe4tOo7KmIt31BDlnLdF9OvJJ/OEltPpBD7MI
	EBOm9+pMjqsqvzvvLUY54MdPzFA6JivAXwl3vaawjwoPRzzgbhCEjAp0/Zd/hqc6
X-Gm-Gg: ATEYQzy17+02MJkhNlKZq1JjV0eQ19qdB7cyat5O5HoPll9+fHSSuLH9s4YiS86QNRZ
	3IxDF2H7/2lGXPyCS/134XQFsD9i7NQPSbVnAdtoJmOIvop1CarxChI+XyQTgknN3S5DYV5bpkc
	jAkq8dY7YKWRi3FM8AJPCjq+Mw8+fxB6pJbf2vAPHpGiuWHhEbqOxKLQwo99Z+wWsLDScLZiCmI
	HrakRCJOhNEEUAXRtIRa4lYZ9gnQerp0ByU1ichxnnVjHdW8ntyhoI7nxZjvqUwT0u+kmEtB6m7
	gZd26WRfUaY1ss/hANHqQgkW+EgYKlt8VVWUFR9FDXAizmVG3JlJkugm3p3NFH442PHZdT4cbWD
	ez3hoCiemY7s41LVqjNQQLnd8Gsg/ZtF8iRfBgqpxGPhq+Fujjgp39YbW29S77e2mlUa24nXDm/
	/ld2mfA3CBXGsrrvjzQBB/M6AGIp93mMnb9evQJO43WzYv4SiUmQ/gcikQQHKAl3OIoZjVFA0=
X-Received: by 2002:a05:6102:3585:b0:5ef:a416:be63 with SMTP id ada2fe7eead31-5ff1d01521amr8605453137.22.1772446272369;
        Mon, 02 Mar 2026 02:11:12 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df644d593sm11367985241.7.2026.03.02.02.11.11
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 02:11:11 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5ff28393b18so2116358137.0
        for <linux-m68k@vger.kernel.org>; Mon, 02 Mar 2026 02:11:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVOGmJjQDDaCnJPfhI5O+NJRgjH6DEnHzF+1apwFd27KTFrDN10zcb7Sk0fgqnO9S12AiDdyxf8Mc0u@vger.kernel.org
X-Received: by 2002:a05:6102:510a:b0:5f8:e53a:2d81 with SMTP id
 ada2fe7eead31-5ff1ce1daf7mr7302498137.8.1772446271226; Mon, 02 Mar 2026
 02:11:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
 <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org> <48af5d8ed5b1546cb3db3b2c2314b1e41de38aad.camel@physik.fu-berlin.de>
 <0d7b5c87-f0f7-70a4-cf75-5147e67904da@yahoo.com> <131b33a26efd2b0e21dfee784821dcaf3aeddad4.camel@physik.fu-berlin.de>
 <7d9d8c95-1b06-c6c5-0932-7ba3af55829a@linux-m68k.org> <CABq5eXH8S9MVoRi5znU+u7EJPmaRA+8yOyd-QKBJMQa10UoAmw@mail.gmail.com>
 <6c1d08bf4cd4d7c92338357bd61dca8a23559ad0.camel@physik.fu-berlin.de>
 <WtNQmVJr3uIeOkUfpStavGscYvoTLpprxvowAOsqJKw8V7XCOZqKDi3Qw7Z1m8JVMsv71f0VZCVqZ3MiKnjLYp-VwSvtvTLkoVtJpAkA0gA=@r-v-e.co>
 <c4f086207e68843ea154b5d41950957fa11c6837.camel@physik.fu-berlin.de>
 <CAMuHMdU7Px7bT4XCZC=vF6aUFGj8=cd=refOf2u17mRjp2FUSA@mail.gmail.com>
 <2c10a9539a82b534e4a815361bb24c04d30b7e67.camel@physik.fu-berlin.de>
 <CAMuHMdXnebgBVWp-uxrmxTFKZkQVU2h-OW7H+7hJ+4beN9DFLg@mail.gmail.com>
 <9f1613138de30db0248649e6a36c2b063693057f.camel@physik.fu-berlin.de>
 <f1f4afab-51a4-10b5-106c-e9e6e5528e6f@kolla.no> <9277b6ef0478bc6651c03b4220004a4c8a2e1cdb.camel@physik.fu-berlin.de>
 <e01dfc6d-a45f-4d17-a27c-67f913dc614c@app.fastmail.com> <CAMuHMdWoO-Hpd3mxr1BXT_cNbvMg45v3ZT8SvxiYAWA3w3W4EQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWoO-Hpd3mxr1BXT_cNbvMg45v3ZT8SvxiYAWA3w3W4EQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 11:11:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW-if+=3qLW9sDOa_cQ6zO1OtOHAAjZasrY4m8_43gzNQ@mail.gmail.com>
X-Gm-Features: AaiRm52V0Ua2Xu3MNpBc41A23znrpV7q6L01OFKuQU4Tq9JGUC635e7joI763U4
Message-ID: <CAMuHMdW-if+=3qLW9sDOa_cQ6zO1OtOHAAjZasrY4m8_43gzNQ@mail.gmail.com>
Subject: Re: Preliminary results - was: Re: Question on BIGGEST_ALIGNMENT in
 GCC on NetBSD/m68k
To: Arnd Bergmann <arnd@arndb.de>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>, 
	"port-m68k@netbsd.org" <port-m68k@netbsd.org>, 
	"debian-68k@lists.debian.org" <debian-68k@lists.debian.org>, 
	"linux-m68k@vger.kernel.org" <linux-m68k@vger.kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Wed, 11 Feb 2026 at 11:41, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, 6 Jan 2026 at 16:38, Arnd Bergmann <arnd@arndb.de> wrote:
> > --- a/include/uapi/linux/rseq.h
> > +++ b/include/uapi/linux/rseq.h
> > @@ -142,9 +142,13 @@ struct rseq {
> >         __u32 mm_cid;
> >
> >         /*
> > -        * Flexible array member at end of structure, after last feature field.
> > +        * Flexible array member at end of structure, after last feature field,
> > +        * but overlapping with the padding.
> >          */
> > -       char end[];
> > +       union {
> > +               __u32 :32;
> > +               __DECLARE_FLEX_ARRAY(char, end);
> > +       };
>
> After commit d6200245c75e832a ("rseq: Allow registering RSEQ with
> slice extension"), the padding must be removed again.

And after commit 3b68df978133ac3d ("rseq: slice ext: Ensure rseq
feature size differs from original rseq size"), we need (different)
padding again:

    -    __u32 :32;
    +    __u8 pad[31];

>
> >  } __attribute__((aligned(4 * sizeof(__u64))));
> >
> >  #endif /* _UAPI_LINUX_RSEQ_H */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
