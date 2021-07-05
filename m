Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90918C07E99
	for <linux-m68k@archiver.kernel.org>; Mon,  5 Jul 2021 20:39:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F0AC61982
	for <linux-m68k@archiver.kernel.org>; Mon,  5 Jul 2021 20:39:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbhGEUmA (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 5 Jul 2021 16:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbhGEUmA (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 5 Jul 2021 16:42:00 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EDCBC061574
        for <linux-m68k@lists.linux-m68k.org>; Mon,  5 Jul 2021 13:39:22 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id v14so8869296lfb.4
        for <linux-m68k@lists.linux-m68k.org>; Mon, 05 Jul 2021 13:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NP1MEzXDD0fHtMXKZdd+ap5uF2JPpshDlQXXDmEkGi4=;
        b=PkpoW/yUgChDbD2slEHLybEqgRxAGdsa4zXTERFRwrEl5gNlBpPdmMQvRyw3DmCZWE
         BO7Qc+dYEkuvMGvv6NIKFbc+4/q1DpubFijAZjFXCTwSdCDN4u5+/VjY38tkgF2UDqyP
         MRqO33DJc8z4+fO35m+HTIReSn1Ds/wwhT2c4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NP1MEzXDD0fHtMXKZdd+ap5uF2JPpshDlQXXDmEkGi4=;
        b=mYydXDeuArQjpmEoVK1j8dqOblR1YvnckB2rINn2QhX6PR8f5wXSjQNtfrdXMmn4Rm
         GQeQdmOy/j2X9lAfu1EAkOlatPrm6ntBq8HEloIQTH4r1jz35iew04sa+fgjKnA4w67D
         M4wKsMBWN9w25jBBdOQoIM/ezEasYIm+I4GYJwNJnu9ZqMB39ImZTqLCuviHeVkdVNcL
         tsvb6UpDHsYG4nh7x5fCCjHcGJlnBkHrlycX1c6jlXeiE/M48w6ZeoslifZDhwbyl4kN
         uMzS/xXypdLNfAxjKmDy1oDxl7TmvXyByoRANK1fenZicO0HqNboQSEWUQ4MbdJNLT3d
         AuVw==
X-Gm-Message-State: AOAM532FQFcRDaguSaviZfCAIkD3frUZahFwAU05BzNI/96cckpNL3+w
        q+YDqv+yLgzr6tHW0/tf5YzATHv8XWi8tP9V
X-Google-Smtp-Source: ABdhPJxudJtSwZiF/EAYY62ss1p910JPLj4fmJ4ix7ATuT19Ydex9pBtoH0QAVkOf4HFDu8Gh9nAcg==
X-Received: by 2002:ac2:5f70:: with SMTP id c16mr10554331lfc.114.1625517560398;
        Mon, 05 Jul 2021 13:39:20 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id n7sm60087lfl.123.2021.07.05.13.39.19
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jul 2021 13:39:19 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id d16so34379771lfn.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 05 Jul 2021 13:39:19 -0700 (PDT)
X-Received: by 2002:ac2:42d6:: with SMTP id n22mr11696241lfl.41.1625517559555;
 Mon, 05 Jul 2021 13:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210705055719.949875-1-hch@lst.de> <20210705055719.949875-2-hch@lst.de>
 <CAMuHMdV4UQaKE7fn0_HhPfHzwEMwouPvqoeW6_V13yebe7ZSQQ@mail.gmail.com>
In-Reply-To: <CAMuHMdV4UQaKE7fn0_HhPfHzwEMwouPvqoeW6_V13yebe7ZSQQ@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 5 Jul 2021 13:39:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgjWebav7K_F7WS7KiwOAYr8KktsZiaV+jYP5LU5RB3Sg@mail.gmail.com>
Message-ID: <CAHk-=wgjWebav7K_F7WS7KiwOAYr8KktsZiaV+jYP5LU5RB3Sg@mail.gmail.com>
Subject: Re: [PATCH] m68knommu: remove set_fs()
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Christoph Hellwig <hch@lst.de>, Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        uClinux development list <uclinux-dev@uclinux.org>
Content-Type: multipart/mixed; boundary="000000000000b6dda605c6664c2a"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

--000000000000b6dda605c6664c2a
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 5, 2021 at 1:46 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Probably this should be
>
>     select SET_FS if CPU_HAS_ADDRESS_SPACES

Actually, I don't think m68k has a single real "set_fs()" at all, and
it should just be converted as-is to not use CONFIG_SET_FS.

Yes, there is a "set_fs()" function, but none of the remaining uses
actually are the traditional kernel style of "use kernel addresses as
user addresses". So as far as the *kernel* is concerned, m68k already
looks like a no-SET_FS architecture, and "set-fs()" is purely a
syntactic thing.

So I think the right thing to do looks something like this:

 - make the rule be that SFC/DFC is always normally USER_DATA

 - the special m68k sequences that need to play with special segments
will always do

        preempt_disable();
        set_segment(..whatever segment they need..);
        .. do the special operation ..
        set_segment(USER_DATA);
        preempt_enable();

 - set_fs() goes away entirely, because the user access functions
always work on USER_DATA and SFC/DFC is always right for them.

Anyway, I'm attaching a COMPLETELY UNTESTED AND ALMOST CERTAINLY VERY
VERY BROKEN patch that is likely not at all correct, but shows what I
think the solution should be.

The important thing is really just the removal of SET_FS entirely, the
rest is me winging it.

NOTE! The above very much assumes that all the special non-USER_DATA
accesses can always be done with preemption disabled. Why? Because I
also made the context switching always just save USER_DATA as the
segment. I didn't *remove* the segment switching - because I'm not
sure if that "just disable preemption across things that do segment
games" is actually valid.

So *if* that preempt_disable/enable is ok, then the segment switching
can just be removed entirely at context switch time.

And if it is *not* ok, then the preempt_disable/enable should go away,
and the context switch should save/restore the actual SFC/DFC value.

Again - let me be very very clear: the only m68k I've ever used was a
68008. It didn't have segments. This patch is COMPLETE GARBAGE. Do not
trust it. Do not use it for anything but a "Linus suggests maybe
something along these lines could work".

This has not even been build-tested, and I'm pretty sure it won't
build as-is. It really is a "Linus did some pattern matching and a few
grep's".

Oh, and if the magical SFC/DFC games can happen in interrupts, then
the "preempt_disable/enable" actually needs to be a full interrupt
disable/enable, or the code needs to re-introduce that "save old
value, restore it". So that's another assumption this example patch
makes - that the SFC/DFC games only happen in process context. Which
may be complete garbage too.

Did I mention that I think this patch is garbage? Because it really is.

                Linus

--000000000000b6dda605c6664c2a
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_kqr363gm0>
X-Attachment-Id: f_kqr363gm0

IGFyY2gvbTY4ay9LY29uZmlnICAgICAgICAgICAgICAgIHwgIDEgLQogYXJjaC9tNjhrL2luY2x1
ZGUvYXNtL3NlZ21lbnQuaCAgfCAyMSArKystLS0tLS0tLS0tLS0tLS0tLS0KIGFyY2gvbTY4ay9p
bmNsdWRlL2FzbS90bGJmbHVzaC5oIHwgIDcgKysrKy0tLQogYXJjaC9tNjhrL2tlcm5lbC9wcm9j
ZXNzLmMgICAgICAgfCAgMiArLQogYXJjaC9tNjhrL2tlcm5lbC90cmFwcy5jICAgICAgICAgfCAx
NiArKysrKysrKy0tLS0tLS0tCiBhcmNoL202OGsvbW0vY2FjaGUuYyAgICAgICAgICAgICB8IDIz
ICsrKysrKysrKysrKysrLS0tLS0tLS0tCiBhcmNoL202OGsvbW0vaW5pdC5jICAgICAgICAgICAg
ICB8ICAyICstCiBhcmNoL202OGsvbW0vbW90b3JvbGEuYyAgICAgICAgICB8ICAyICstCiBhcmNo
L202OGsvc3VuMy9jb25maWcuYyAgICAgICAgICB8ICAyICstCiBhcmNoL202OGsvc3VuMy9tbXVf
ZW11LmMgICAgICAgICB8ICA3ICsrKystLS0KIDEwIGZpbGVzIGNoYW5nZWQsIDM3IGluc2VydGlv
bnMoKyksIDQ2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvbTY4ay9LY29uZmlnIGIv
YXJjaC9tNjhrL0tjb25maWcKaW5kZXggOTY5ODlhZDQ2ZjY2Li4zYTgzMDEzZjBhOTYgMTAwNjQ0
Ci0tLSBhL2FyY2gvbTY4ay9LY29uZmlnCisrKyBiL2FyY2gvbTY4ay9LY29uZmlnCkBAIC0zMiw3
ICszMiw2IEBAIGNvbmZpZyBNNjhLCiAJc2VsZWN0IE5PX0RNQSBpZiAhTU1VICYmICFDT0xERklS
RQogCXNlbGVjdCBPTERfU0lHQUNUSU9OCiAJc2VsZWN0IE9MRF9TSUdTVVNQRU5EMwotCXNlbGVj
dCBTRVRfRlMKIAlzZWxlY3QgVUFDQ0VTU19NRU1DUFkgaWYgIU1NVQogCXNlbGVjdCBWSVJUX1RP
X0JVUwogCXNlbGVjdCBaT05FX0RNQQpkaWZmIC0tZ2l0IGEvYXJjaC9tNjhrL2luY2x1ZGUvYXNt
L3NlZ21lbnQuaCBiL2FyY2gvbTY4ay9pbmNsdWRlL2FzbS9zZWdtZW50LmgKaW5kZXggMmI1ZTY4
YTcxZWY3Li5hOWZhYmY3ZDJhMmMgMTAwNjQ0Ci0tLSBhL2FyY2gvbTY4ay9pbmNsdWRlL2FzbS9z
ZWdtZW50LmgKKysrIGIvYXJjaC9tNjhrL2luY2x1ZGUvYXNtL3NlZ21lbnQuaApAQCAtMjYsMTkg
KzI2LDkgQEAgdHlwZWRlZiBzdHJ1Y3QgewogCiAjaWZkZWYgQ09ORklHX0NQVV9IQVNfQUREUkVT
U19TUEFDRVMKIC8qCi0gKiBHZXQvc2V0IHRoZSBTRkMvREZDIHJlZ2lzdGVycyBmb3IgTU9WRVMg
aW5zdHJ1Y3Rpb25zCisgKiBTZXQgdGhlIFNGQy9ERkMgcmVnaXN0ZXJzIGZvciBNT1ZFUyBpbnN0
cnVjdGlvbnMKICAqLwotI2RlZmluZSBVU0VSX0RTCQlNQUtFX01NX1NFRyhfX1VTRVJfRFMpCi0j
ZGVmaW5lIEtFUk5FTF9EUwlNQUtFX01NX1NFRyhfX0tFUk5FTF9EUykKLQotc3RhdGljIGlubGlu
ZSBtbV9zZWdtZW50X3QgZ2V0X2ZzKHZvaWQpCi17Ci0JbW1fc2VnbWVudF90IF92OwotCV9fYXNt
X18gKCJtb3ZlYyAlL2RmYywlMCI6Ij1yIiAoX3Yuc2VnKTopOwotCXJldHVybiBfdjsKLX0KLQot
c3RhdGljIGlubGluZSB2b2lkIHNldF9mcyhtbV9zZWdtZW50X3QgdmFsKQorc3RhdGljIGlubGlu
ZSB2b2lkIHNldF9zZWdtZW50KG1tX3NlZ21lbnRfdCB2YWwpCiB7CiAJX19hc21fXyBfX3ZvbGF0
aWxlX18gKCJtb3ZlYyAlMCwlL3NmY1xuXHQiCiAJCQkgICAgICAibW92ZWMgJTAsJS9kZmNcblx0
IgpAQCAtNDYsMTQgKzM2LDkgQEAgc3RhdGljIGlubGluZSB2b2lkIHNldF9mcyhtbV9zZWdtZW50
X3QgdmFsKQogfQogCiAjZWxzZQotI2RlZmluZSBVU0VSX0RTCQlNQUtFX01NX1NFRyhUQVNLX1NJ
WkUpCi0jZGVmaW5lIEtFUk5FTF9EUwlNQUtFX01NX1NFRygweEZGRkZGRkZGKQotI2RlZmluZSBn
ZXRfZnMoKQkoY3VycmVudF90aHJlYWRfaW5mbygpLT5hZGRyX2xpbWl0KQotI2RlZmluZSBzZXRf
ZnMoeCkJKGN1cnJlbnRfdGhyZWFkX2luZm8oKS0+YWRkcl9saW1pdCA9ICh4KSkKKyNkZWZpbmUg
c2V0X3NlZ21lbnQoeCkJKCh2b2lkKSh4KSkKICNlbmRpZgogCi0jZGVmaW5lIHVhY2Nlc3Nfa2Vy
bmVsKCkJKGdldF9mcygpLnNlZyA9PSBLRVJORUxfRFMuc2VnKQotCiAjZW5kaWYgLyogX19BU1NF
TUJMWV9fICovCiAKICNlbmRpZiAvKiBfTTY4S19TRUdNRU5UX0ggKi8KZGlmZiAtLWdpdCBhL2Fy
Y2gvbTY4ay9pbmNsdWRlL2FzbS90bGJmbHVzaC5oIGIvYXJjaC9tNjhrL2luY2x1ZGUvYXNtL3Rs
YmZsdXNoLmgKaW5kZXggYTYzMThjY2QzMDhmLi4zYzllMzVjN2U5M2YgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvbTY4ay9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCisrKyBiL2FyY2gvbTY4ay9pbmNsdWRlL2Fz
bS90bGJmbHVzaC5oCkBAIC0xMywxMyArMTMsMTQgQEAgc3RhdGljIGlubGluZSB2b2lkIGZsdXNo
X3RsYl9rZXJuZWxfcGFnZSh2b2lkICphZGRyKQogCWlmIChDUFVfSVNfQ09MREZJUkUpIHsKIAkJ
bW11X3dyaXRlKE1NVU9SLCBNTVVPUl9DTkwpOwogCX0gZWxzZSBpZiAoQ1BVX0lTXzA0MF9PUl8w
NjApIHsKLQkJbW1fc2VnbWVudF90IG9sZF9mcyA9IGdldF9mcygpOwotCQlzZXRfZnMoS0VSTkVM
X0RTKTsKKwkJcHJlZW1wdF9kaXNhYmxlKCk7CisJCXNldF9zZWdtZW50KFNVUEVSX0RBVEEpOwog
CQlfX2FzbV9fIF9fdm9sYXRpbGVfXygiLmNoaXAgNjgwNDBcblx0IgogCQkJCSAgICAgInBmbHVz
aCAoJTApXG5cdCIKIAkJCQkgICAgICIuY2hpcCA2OGsiCiAJCQkJICAgICA6IDogImEiIChhZGRy
KSk7Ci0JCXNldF9mcyhvbGRfZnMpOworCQlzZXRfc2VnbWVudChVU0VSX0RBVEEpOworCQlwcmVl
bXB0X2VuYWJsZSgpOwogCX0gZWxzZSBpZiAoQ1BVX0lTXzAyMF9PUl8wMzApCiAJCV9fYXNtX18g
X192b2xhdGlsZV9fKCJwZmx1c2ggIzQsIzQsKCUwKSIgOiA6ICJhIiAoYWRkcikpOwogfQpkaWZm
IC0tZ2l0IGEvYXJjaC9tNjhrL2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNoL202OGsva2VybmVsL3By
b2Nlc3MuYwppbmRleCBkYjQ5ZjkwOTE3MTEuLmExNzZkMDBmZmM5NyAxMDA2NDQKLS0tIGEvYXJj
aC9tNjhrL2tlcm5lbC9wcm9jZXNzLmMKKysrIGIvYXJjaC9tNjhrL2tlcm5lbC9wcm9jZXNzLmMK
QEAgLTE1NSw3ICsxNTUsNyBAQCBpbnQgY29weV90aHJlYWQodW5zaWduZWQgbG9uZyBjbG9uZV9m
bGFncywgdW5zaWduZWQgbG9uZyB1c3AsIHVuc2lnbmVkIGxvbmcgYXJnLAogCSAqIE11c3Qgc2F2
ZSB0aGUgY3VycmVudCBTRkMvREZDIHZhbHVlLCBOT1QgdGhlIHZhbHVlIHdoZW4KIAkgKiB0aGUg
cGFyZW50IHdhcyBsYXN0IGRlc2NoZWR1bGVkIC0gUkdIICAxMC0wOC05NgogCSAqLwotCXAtPnRo
cmVhZC5mcyA9IGdldF9mcygpLnNlZzsKKwlwLT50aHJlYWQuZnMgPSBVU0VSX0RBVEEuc2VnOwog
CiAJaWYgKHVubGlrZWx5KHAtPmZsYWdzICYgKFBGX0tUSFJFQUQgfCBQRl9JT19XT1JLRVIpKSkg
ewogCQkvKiBrZXJuZWwgdGhyZWFkICovCmRpZmYgLS1naXQgYS9hcmNoL202OGsva2VybmVsL3Ry
YXBzLmMgYi9hcmNoL202OGsva2VybmVsL3RyYXBzLmMKaW5kZXggOWUxMjYxNDYyYmNjLi44NTg2
MzE4MTQ2NmMgMTAwNjQ0Ci0tLSBhL2FyY2gvbTY4ay9rZXJuZWwvdHJhcHMuYworKysgYi9hcmNo
L202OGsva2VybmVsL3RyYXBzLmMKQEAgLTE4MSw5ICsxODEsOSBAQCBzdGF0aWMgaW5saW5lIHZv
aWQgYWNjZXNzX2Vycm9yMDYwIChzdHJ1Y3QgZnJhbWUgKmZwKQogc3RhdGljIGlubGluZSB1bnNp
Z25lZCBsb25nIHByb2JlMDQwKGludCBpc3dyaXRlLCB1bnNpZ25lZCBsb25nIGFkZHIsIGludCB3
YnMpCiB7CiAJdW5zaWduZWQgbG9uZyBtbXVzcjsKLQltbV9zZWdtZW50X3Qgb2xkX2ZzID0gZ2V0
X2ZzKCk7CiAKLQlzZXRfZnMoTUFLRV9NTV9TRUcod2JzKSk7CisJcHJlZW1wdF9kaXNhYmxlKCk7
CisJc2V0X3NlZ21lbnQoTUFLRV9NTV9TRUcod2JzKSk7CiAKIAlpZiAoaXN3cml0ZSkKIAkJYXNt
IHZvbGF0aWxlICgiLmNoaXAgNjgwNDA7IHB0ZXN0dyAoJTApOyAuY2hpcCA2OGsiIDogOiAiYSIg
KGFkZHIpKTsKQEAgLTE5Miw3ICsxOTIsOCBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcg
cHJvYmUwNDAoaW50IGlzd3JpdGUsIHVuc2lnbmVkIGxvbmcgYWRkciwgaW50IHdicykKIAogCWFz
bSB2b2xhdGlsZSAoIi5jaGlwIDY4MDQwOyBtb3ZlYyAlJW1tdXNyLCUwOyAuY2hpcCA2OGsiIDog
Ij1yIiAobW11c3IpKTsKIAotCXNldF9mcyhvbGRfZnMpOworCXNldF9zZWdtZW50KFVTRVJfREFU
QSk7CisJcHJlZW1wdF9lbmFibGUoKTsKIAogCXJldHVybiBtbXVzcjsKIH0KQEAgLTIwMSwxMCAr
MjAyLDkgQEAgc3RhdGljIGlubGluZSBpbnQgZG9fMDQwd3JpdGViYWNrMSh1bnNpZ25lZCBzaG9y
dCB3YnMsIHVuc2lnbmVkIGxvbmcgd2JhLAogCQkJCSAgIHVuc2lnbmVkIGxvbmcgd2JkKQogewog
CWludCByZXMgPSAwOwotCW1tX3NlZ21lbnRfdCBvbGRfZnMgPSBnZXRfZnMoKTsKIAotCS8qIHNl
dF9mcyBjYW4gbm90IGJlIG1vdmVkLCBvdGhlcndpc2UgcHV0X3VzZXIoKSBtYXkgb29wcyAqLwot
CXNldF9mcyhNQUtFX01NX1NFRyh3YnMpKTsKKwlwcmVlbXB0X2Rpc2FibGUoKTsKKwlzZXRfc2Vn
bWVudChNQUtFX01NX1NFRyh3YnMpKTsKIAogCXN3aXRjaCAod2JzICYgV0JTSVpfMDQwKSB7CiAJ
Y2FzZSBCQV9TSVpFX0JZVEU6CkBAIC0yMTgsOCArMjE4LDggQEAgc3RhdGljIGlubGluZSBpbnQg
ZG9fMDQwd3JpdGViYWNrMSh1bnNpZ25lZCBzaG9ydCB3YnMsIHVuc2lnbmVkIGxvbmcgd2JhLAog
CQlicmVhazsKIAl9CiAKLQkvKiBzZXRfZnMgY2FuIG5vdCBiZSBtb3ZlZCwgb3RoZXJ3aXNlIHB1
dF91c2VyKCkgbWF5IG9vcHMgKi8KLQlzZXRfZnMob2xkX2ZzKTsKKwlzZXRfc2VnbWVudChVU0VS
X0RBVEEpOworCXByZWVtcHRfZW5hYmxlKCk7CiAKIAogCXByX2RlYnVnKCJkb18wNDB3cml0ZWJh
Y2sxLCByZXM9JWRcbiIsIHJlcyk7CmRpZmYgLS1naXQgYS9hcmNoL202OGsvbW0vY2FjaGUuYyBi
L2FyY2gvbTY4ay9tbS9jYWNoZS5jCmluZGV4IGI0ODZjMDg4OWVlYy4uODBlMzExYWE5MjRkIDEw
MDY0NAotLS0gYS9hcmNoL202OGsvbW0vY2FjaGUuYworKysgYi9hcmNoL202OGsvbW0vY2FjaGUu
YwpAQCAtMTIsNyArMTIsNyBAQAogI2luY2x1ZGUgPGFzbS90cmFwcy5oPgogCiAKLXN0YXRpYyB1
bnNpZ25lZCBsb25nIHZpcnRfdG9fcGh5c19zbG93KHVuc2lnbmVkIGxvbmcgdmFkZHIpCitzdGF0
aWMgdW5zaWduZWQgbG9uZyB2aXJ0X3RvX3BoeXNfc2xvdyh1bnNpZ25lZCBsb25nIHZhZGRyLCBt
bV9zZWdtZW50X3Qgc2VnKQogewogCWlmIChDUFVfSVNfMDYwKSB7CiAJCXVuc2lnbmVkIGxvbmcg
cGFkZHI7CkBAIC01NSw3ICs1NSw3IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIHZpcnRfdG9fcGh5
c19zbG93KHVuc2lnbmVkIGxvbmcgdmFkZHIpCiAJCWFzbSB2b2xhdGlsZSAoInB0ZXN0ciAlMywl
MkAsIzcsJTBcblx0IgogCQkJICAgICAgInBtb3ZlICUlcHNyLCUxIgogCQkJICAgICAgOiAiPWEm
IiAoZGVzY2FkZHIpLCAiPW0iIChtbXVzcikKLQkJCSAgICAgIDogImEiICh2YWRkciksICJkIiAo
Z2V0X2ZzKCkuc2VnKSk7CisJCQkgICAgICA6ICJhIiAodmFkZHIpLCAiZCIgKHNlZy5zZWcpKTsK
IAkJaWYgKG1tdXNyICYgKE1NVV9JfE1NVV9CfE1NVV9MKSkKIAkJCXJldHVybiAwOwogCQlkZXNj
YWRkciA9IHBoeXNfdG9fdmlydCgodW5zaWduZWQgbG9uZylkZXNjYWRkcik7CkBAIC03Myw3ICs3
Myw3IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIHZpcnRfdG9fcGh5c19zbG93KHVuc2lnbmVkIGxv
bmcgdmFkZHIpCiAKIC8qIFB1c2ggbiBwYWdlcyBhdCBrZXJuZWwgdmlydHVhbCBhZGRyZXNzIGFu
ZCBjbGVhciB0aGUgaWNhY2hlICovCiAvKiBSWjogdXNlIGNwdXNoICViYyBpbnN0ZWFkIG9mIGNw
dXNoICVkYywgY2ludiAlaWMgKi8KLXZvaWQgZmx1c2hfaWNhY2hlX3VzZXJfcmFuZ2UodW5zaWdu
ZWQgbG9uZyBhZGRyZXNzLCB1bnNpZ25lZCBsb25nIGVuZGFkZHIpCitzdGF0aWMgdm9pZCBkb19m
bHVzaF9pY2FjaGVfdXNlcl9yYW5nZSh1bnNpZ25lZCBsb25nIGFkZHJlc3MsIHVuc2lnbmVkIGxv
bmcgZW5kYWRkciwgbW1fc2VnbWVudF90IHNlZykKIHsKIAlpZiAoQ1BVX0lTX0NPTERGSVJFKSB7
CiAJCXVuc2lnbmVkIGxvbmcgc3RhcnQsIGVuZDsKQEAgLTkyLDcgKzkyLDcgQEAgdm9pZCBmbHVz
aF9pY2FjaGVfdXNlcl9yYW5nZSh1bnNpZ25lZCBsb25nIGFkZHJlc3MsIHVuc2lnbmVkIGxvbmcg
ZW5kYWRkcikKIAkJCQkgICAgICAiLmNoaXAgNjgwNDBcblx0IgogCQkJCSAgICAgICJjcHVzaHAg
JSViYywoJTApXG5cdCIKIAkJCQkgICAgICAiLmNoaXAgNjhrIgotCQkJCSAgICAgIDogOiAiYSIg
KHZpcnRfdG9fcGh5c19zbG93KGFkZHJlc3MpKSk7CisJCQkJICAgICAgOiA6ICJhIiAodmlydF90
b19waHlzX3Nsb3coYWRkcmVzcywgc2VnKSkpOwogCQkJYWRkcmVzcyArPSBQQUdFX1NJWkU7CiAJ
CX0gd2hpbGUgKGFkZHJlc3MgPCBlbmRhZGRyKTsKIAl9IGVsc2UgewpAQCAtMTA1LDEzICsxMDUs
MTggQEAgdm9pZCBmbHVzaF9pY2FjaGVfdXNlcl9yYW5nZSh1bnNpZ25lZCBsb25nIGFkZHJlc3Ms
IHVuc2lnbmVkIGxvbmcgZW5kYWRkcikKIAl9CiB9CiAKLXZvaWQgZmx1c2hfaWNhY2hlX3Jhbmdl
KHVuc2lnbmVkIGxvbmcgYWRkcmVzcywgdW5zaWduZWQgbG9uZyBlbmRhZGRyKQordm9pZCBmbHVz
aF9pY2FjaGVfdXNlcl9yYW5nZSh1bnNpZ25lZCBsb25nIGFkZHJlc3MsIHVuc2lnbmVkIGxvbmcg
ZW5kYWRkcikKIHsKLQltbV9zZWdtZW50X3Qgb2xkX2ZzID0gZ2V0X2ZzKCk7CisJZG9fZmx1c2hf
aWNhY2hlX3JhbmdlKGFkZHJlc3MsIGVuZGFkZHIsIFVTRVJfREFUQSk7Cit9CiAKLQlzZXRfZnMo
S0VSTkVMX0RTKTsKLQlmbHVzaF9pY2FjaGVfdXNlcl9yYW5nZShhZGRyZXNzLCBlbmRhZGRyKTsK
LQlzZXRfZnMob2xkX2ZzKTsKK3ZvaWQgZmx1c2hfaWNhY2hlX3JhbmdlKHVuc2lnbmVkIGxvbmcg
YWRkcmVzcywgdW5zaWduZWQgbG9uZyBlbmRhZGRyKQoreworCXByZWVtcHRfZGlzYWJsZSgpOwor
CXNldF9zZWdtZW50KFNVUEVSX0RBVEEpOworCWRvX2ZsdXNoX2ljYWNoZV9yYW5nZShhZGRyZXNz
LCBlbmRhZGRyLCBTVVBFUl9EQVRBKTsKKwlzZXRfc2VnbWVudChVU0VSX0RBVEEpOworCXByZWVt
cHRfZW5hYmxlKCk7CiB9CiBFWFBPUlRfU1lNQk9MKGZsdXNoX2ljYWNoZV9yYW5nZSk7CiAKZGlm
ZiAtLWdpdCBhL2FyY2gvbTY4ay9tbS9pbml0LmMgYi9hcmNoL202OGsvbW0vaW5pdC5jCmluZGV4
IDVkNzQ5ZTE4ODI0Ni4uNGE3YTU2MTM5MDEzIDEwMDY0NAotLS0gYS9hcmNoL202OGsvbW0vaW5p
dC5jCisrKyBiL2FyY2gvbTY4ay9tbS9pbml0LmMKQEAgLTc2LDcgKzc2LDcgQEAgdm9pZCBfX2lu
aXQgcGFnaW5nX2luaXQodm9pZCkKIAkvKgogCSAqIFNldCB1cCBTRkMvREZDIHJlZ2lzdGVycyAo
dXNlciBkYXRhIHNwYWNlKS4KIAkgKi8KLQlzZXRfZnMgKFVTRVJfRFMpOworCXNldF9zZWdtZW50
KFVTRVJfREFUQSk7CiAKIAltYXhfem9uZV9wZm5bWk9ORV9ETUFdID0gZW5kX21lbSA+PiBQQUdF
X1NISUZUOwogCWZyZWVfYXJlYV9pbml0KG1heF96b25lX3Bmbik7CmRpZmYgLS1naXQgYS9hcmNo
L202OGsvbW0vbW90b3JvbGEuYyBiL2FyY2gvbTY4ay9tbS9tb3Rvcm9sYS5jCmluZGV4IDNhNjUz
ZjBhNDE4OC4uN2FmN2Q1YTFhYzc3IDEwMDY0NAotLS0gYS9hcmNoL202OGsvbW0vbW90b3JvbGEu
YworKysgYi9hcmNoL202OGsvbW0vbW90b3JvbGEuYwpAQCAtNDY3LDcgKzQ2Nyw3IEBAIHZvaWQg
X19pbml0IHBhZ2luZ19pbml0KHZvaWQpCiAJLyoKIAkgKiBTZXQgdXAgU0ZDL0RGQyByZWdpc3Rl
cnMKIAkgKi8KLQlzZXRfZnMoS0VSTkVMX0RTKTsKKwlzZXRfc2VnbWVudChVU0VSX0RBVEEpOwog
CiAjaWZkZWYgREVCVUcKIAlwcmludGsgKCJiZWZvcmUgZnJlZV9hcmVhX2luaXRcbiIpOwpkaWZm
IC0tZ2l0IGEvYXJjaC9tNjhrL3N1bjMvY29uZmlnLmMgYi9hcmNoL202OGsvc3VuMy9jb25maWcu
YwppbmRleCBmN2RkNDcyMzJiNmMuLjg0OTQ1N2RiYjQyNCAxMDA2NDQKLS0tIGEvYXJjaC9tNjhr
L3N1bjMvY29uZmlnLmMKKysrIGIvYXJjaC9tNjhrL3N1bjMvY29uZmlnLmMKQEAgLTg5LDcgKzg5
LDcgQEAgdm9pZCBfX2luaXQgc3VuM19pbml0KHZvaWQpCiAJc3VuM19yZXNlcnZlZF9wbWVnWzI0
OV0gPSAxOwogCXN1bjNfcmVzZXJ2ZWRfcG1lZ1syNTJdID0gMTsKIAlzdW4zX3Jlc2VydmVkX3Bt
ZWdbMjUzXSA9IDE7Ci0Jc2V0X2ZzKEtFUk5FTF9EUyk7CisJc2V0X3NlZ21lbnQoVVNFUl9EQVRB
KTsKIH0KIAogLyogV2l0aG91dCB0aGlzLCBCYWQgVGhpbmdzIGhhcHBlbiB3aGVuIHNvbWV0aGlu
ZyBjYWxscyBhcmNoX3Jlc2V0LiAqLwpkaWZmIC0tZ2l0IGEvYXJjaC9tNjhrL3N1bjMvbW11X2Vt
dS5jIGIvYXJjaC9tNjhrL3N1bjMvbW11X2VtdS5jCmluZGV4IDdhYTg3OWI3YzdmZi4uMmJjZjdl
OTgyMmU2IDEwMDY0NAotLS0gYS9hcmNoL202OGsvc3VuMy9tbXVfZW11LmMKKysrIGIvYXJjaC9t
NjhrL3N1bjMvbW11X2VtdS5jCkBAIC0xOTEsMTQgKzE5MSwxNSBAQCB2b2lkIF9faW5pdCBtbXVf
ZW11X2luaXQodW5zaWduZWQgbG9uZyBib290bWVtX2VuZCkKIAlmb3Ioc2VnID0gMDsgc2VnIDwg
UEFHRV9PRkZTRVQ7IHNlZyArPSBTVU4zX1BNRUdfU0laRSkKIAkJc3VuM19wdXRfc2VnbWFwKHNl
ZywgU1VOM19JTlZBTElEX1BNRUcpOwogCi0Jc2V0X2ZzKE1BS0VfTU1fU0VHKDMpKTsKKwlwcmVl
bXB0X2Rpc2FibGUoKTsKKwlzZXRfc2VnbWVudChNQUtFX01NX1NFRygzKSk7CiAJZm9yKHNlZyA9
IDA7IHNlZyA8IDB4MTAwMDAwMDA7IHNlZyArPSBTVU4zX1BNRUdfU0laRSkgewogCQlpID0gc3Vu
M19nZXRfc2VnbWFwKHNlZyk7CiAJCWZvcihqID0gMTsgaiA8IENPTlRFWFRTX05VTTsgaisrKQog
CQkJKCoocm9tdmVjLT5wdl9zZXRjdHh0KSkoaiwgKHZvaWQgKilzZWcsIGkpOwogCX0KLQlzZXRf
ZnMoS0VSTkVMX0RTKTsKLQorCXNldF9zZWdtZW50KFVTRVJfREFUQSk7CisJcHJlZW1wdF9lbmFi
bGUoKTsKIH0KIAogLyogZXJhc2UgdGhlIG1hcHBpbmdzIGZvciBhIGRlYWQgY29udGV4dC4gIFVz
ZXMgdGhlIHBnX2RpciBmb3IgaGludHMK
--000000000000b6dda605c6664c2a--
