Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86EF21D3E9
	for <linux-m68k@lists.linux-m68k.org>; Fri,  7 Mar 2025 15:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741362907; cv=none; b=ukVAzdY8uuwiRDdVv0zLz5/tiYlBkVNB/cisyoGPHr0ydlouSJz8KWcD8QF64DucMVBwkrUQHCwuAgx4WGaHHWsNmxYsWQNvv+nh2lGih1KLEJoLcfE43aMdnmZJ7euMiJxpgcA0JoKygi2ff0q8Emha5c1G/LkfgE+cANKL7lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741362907; c=relaxed/simple;
	bh=BqAgNNhHmr48CV5Lby7avsDCaaonSWHfakhBkcS8Gdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lVQtHu0mNsc+UrO46/WiLEASP6qhLBWiust4H/Qcv7J9evZ91LE1MVXK+BmJI4qv4eXFVyd/J48cQoJ7EavEjOcc3Prk2NMkCLEzj7xPYlr7wSvJ6ONC9dtKT4Fn6KWtR9yQymAYLTAQAHs2i4KZlhWeaxaB39GMfJSxlzQm1MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bHeV11dP; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bHeV11dP"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43bc0b8520cso12617645e9.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 07 Mar 2025 07:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741362904; x=1741967704; darn=lists.linux-m68k.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KTIxiohPLNVVB9YfiDexvU2RO8Xj7BqvYc16wsDl4Q4=;
        b=bHeV11dPYTuZjYTylK69mBslgMq3RHEY182ZYS92k+yauLlQG2Eh/4iMmy4MSEgkY3
         kM2EwP/Ard97HO3Rw3RXoJn84DrR6caiwDx0PKaoxXLdrFksaS5AvrbZQUBF4cxWAoOn
         scp0hkt+SxLlxAzSBrEuW3cX/6JY3uffnDhvOgsxc3ojSXYpHQ7WKrbCHVqHgD6g7tD1
         LAfYm/xUQRo7bZ0R9mr4P8v4pIDGZg+pb0AN8TuujjvZ0W0a2V2xqcHughNQdzFi8QJ2
         Em3VmDyRzPkqa3JflhZbtK8zsnyYRpt2PiFtNHCz3Ll4eNF10IORAMY9AsWCIPZ+UQcu
         ffKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741362904; x=1741967704;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KTIxiohPLNVVB9YfiDexvU2RO8Xj7BqvYc16wsDl4Q4=;
        b=GbbvaxJ58+4ozRfUcvHZbMIFMPvhPq2ebC0+o1mFUPOxxAg4VqETkcAb+FnpZ7K1Jn
         Jqbc75B5z6s0xOKmxnwUM9yEXFSDdGKxNG/zmxEuZOJ5ej3iIQg8MnapXJqxgNcpnsy5
         BtJ+8RM//rWN/CPIj2eCw/zXVZ638XqJbEkydB80hnulnfO4ZNjVKi6mMW8MoaRp8JTW
         r6TAfiJvUDY/YS3Hvrj8Vbv6bPBNEQr5sEk0whfzkkbGD3DHjACUEApb96MVZjZaQFSO
         Gi3Mku2/2qwFR7IzkZfEDd63bvW5PtT4UOhxLOdvc4gGJqWnUFnB2EgRPlkUI2WMblpR
         qt/w==
X-Forwarded-Encrypted: i=1; AJvYcCWD7VCeOpftkH7WTFUcsyh+VJRURm7k9mw41h/dfoJT+IVK75GQ7Ih3338x/LRXZImp7LXuPB8l7eSY@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyRcuOH3NCwCjSh1kkZkFRj524JN21cpmtkC44ffUJcv/HgiaYy
	PoY9B+4GhhHGHFpr849QcGi3Ja4Wkc2sMvo+NJkT3I1NgOWRCpLkkr9IHK8S3Ik=
X-Gm-Gg: ASbGncvbvupncCI7U8wrmCQvXu9kKRPjGlFypmbMUIQqaO3vxV4dkP6rQI10O4lS7Ih
	aF/C7No7MuL33LLDLgBws9lyNT8M4G0fWnFVLL/Me/H1qAKrxva6lOdp1hSP2G+mkOFO6w2rXtS
	/dvchS5HpVQjZ6GFz5vw9L6CKsQzzjrVb31YLWCODvzlqfDLGN1MqCir5CV1ffVpcujBX9wewDk
	ginFLX+TZ7ARmKCV5/W0OfkZt5RWky4grddu3HBAyFZgRIMfdBDj832m69wu3C/A14Odgxtbo3Z
	XmqPSmftHYOjC/N+Z6INaZsz06XkqxCINFKq4BZAX9bC2Qs=
X-Google-Smtp-Source: AGHT+IF1iPA/Ntx7JECcdwpFF2+Wr14YZrGvchT9BSUSo4BM6xsm3uEkcR6M6E/FoWaOSUozXYVFDA==
X-Received: by 2002:a05:600c:c6:b0:43b:c1ac:aeeb with SMTP id 5b1f17b1804b1-43cb91c58abmr23566485e9.2.1741362904110;
        Fri, 07 Mar 2025 07:55:04 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8dad73sm56612925e9.19.2025.03.07.07.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 07:55:03 -0800 (PST)
Date: Fri, 7 Mar 2025 16:55:01 +0100
From: Petr Mladek <pmladek@suse.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>,
	David Gow <davidgow@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 1/3] printf: convert self-test to KUnit
Message-ID: <Z8sW1QBgPVUmEzUd@pathway.suse.cz>
References: <20250221-printf-kunit-convert-v5-0-5db840301730@gmail.com>
 <20250221-printf-kunit-convert-v5-1-5db840301730@gmail.com>
 <Z8mUH0comOCpycpK@pathway.suse.cz>
 <CAJ-ks9nFSzRXFauavzSWhvhr2Rou7qqkWi_LZ=4e1Tyr4_bn3g@mail.gmail.com>
 <CAJ-ks9nDLGvzZ+NDAJsk2Hy1=hsCzayg4-65gk60T_WJZzOUzA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9nDLGvzZ+NDAJsk2Hy1=hsCzayg4-65gk60T_WJZzOUzA@mail.gmail.com>

On Thu 2025-03-06 09:41:44, Tamir Duberstein wrote:
> On Thu, Mar 6, 2025 at 9:25 AM Tamir Duberstein <tamird@gmail.com> wrote:
> >
> > On Thu, Mar 6, 2025 at 7:25 AM Petr Mladek <pmladek@suse.com> wrote:
> > >
> > > On Fri 2025-02-21 15:34:30, Tamir Duberstein wrote:
> > > > Convert the printf() self-test to a KUnit test.
> > > >
> > > > [...]
> > > >
> >
> > > 2. What was the motivation to remove the trailing '\n', please?
> > >
> > >    It actually makes a difference from the printk() POV. Messages without
> > >    the trailing '\n' are _not_ flushed to the console until another
> > >    message is added. The reason is that they might still be appended
> > >    by pr_cont(). And printk() emits only complete lines to the
> > >    console.
> > >
> > >    In general, messages should include the trailing '\n' unless the
> > >    code wants to append something later or the trailing '\n' is
> > >    added by another layer of the code. It does not seem to be this case.
> > >
> > >
> > > >                       bufsize, fmt, ret, elen);
> > > > -             return 1;
> > > > +             return;
> > > >       }
> > >
> > > [...]
> >
> > I noticed in my testing that the trailing \n didn't change the test
> > output, but I didn't know the details you shared about the trailing
> > \n. I'll restore them, unless we jump straight to the KUNIT macros per
> > the discussion above.

> Ah, I forgot that `tc_fail` already delegates to KUNIT_FAIL. This was
> the reason I removed the trailing newlines -- there is a mix of
> present and absent trailing newlines in KUNIT_* macros, and it's not
> clear to me what the correct thing is. For instance, the examples in
> Documentation/dev-tools/kunit/{start,usage}.rst omit the trailing newlines.

Honestly, I am not able to find how the KUNIT_FAIL() actually prints
the message. I can't find how assert_format() is defined.

Anyway, it seems that for example, kunit_warn() prints the messages
as is in kunit_log(). It does not add the trailing '\n' on its own.

Also I do not see any empty lines when I add back the trailing '\n'
to KUNIT_FAIL() message. This suggests that even KUNIT_FAIL()
prints the messages as is and does not add any extra trailing '\n'.

In my opinion, using the trailing '\n' is the right thing to do
from the printk() POV. Please, add it back.

Best Regards,
Petr
