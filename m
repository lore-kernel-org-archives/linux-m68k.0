Return-Path: <SRS0=WB/I=7O=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E80DEC433DF
	for <linux-m68k@archiver.kernel.org>; Mon,  1 Jun 2020 10:58:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C796C20679
	for <linux-m68k@archiver.kernel.org>; Mon,  1 Jun 2020 10:58:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725838AbgFAK6Q (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 1 Jun 2020 06:58:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbgFAK6P (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 1 Jun 2020 06:58:15 -0400
X-Greylist: delayed 445 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 01 Jun 2020 03:58:15 PDT
Received: from smtp3.strotmann.de (smtp3.strotmann.de [IPv6:2a03:4000:2:33f::5353])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F017C061A0E
        for <linux-m68k@lists.linux-m68k.org>; Mon,  1 Jun 2020 03:58:15 -0700 (PDT)
Received: from smtp2.strotmann.de (unknown [IPv6:fd00::2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by smtp3.strotmann.de (Postfix) with ESMTPS id F1BA88391B;
        Mon,  1 Jun 2020 12:50:45 +0200 (CEST)
Received: from Carstens-Mac-mini.local (unknown [IPv6:fd00::1000])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp2.strotmann.de (Postfix) with ESMTPSA id 49bBm30f1Nzpf8;
        Mon,  1 Jun 2020 12:50:43 +0200 (CEST)
Subject: Re: Planning a Debian/Linux m68k Meeting in 2020
To:     Carsten Strotmann <cas@strotmann.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Debian m68k <debian-68k@lists.debian.org>
References: <86wo6nwytz.fsf@emacs.strotmann.de>
 <865zcqz6lz.fsf@emacs.strotmann.de>
From:   Carsten Strotmann <carsten@strotmann.de>
Autocrypt: addr=carsten@strotmann.de; prefer-encrypt=mutual; keydata=
 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
Message-ID: <16b695c3-33f7-ecaa-80bc-066d90482bce@strotmann.de>
Date:   Mon, 1 Jun 2020 12:50:41 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <865zcqz6lz.fsf@emacs.strotmann.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="kD01kgKi7dBibvbPOMBqo6aEDHL9AwI7C"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--kD01kgKi7dBibvbPOMBqo6aEDHL9AwI7C
Content-Type: multipart/mixed; boundary="OPxzAiAQZvcGhJayzZIs7SishxdVBXBNL"

--OPxzAiAQZvcGhJayzZIs7SishxdVBXBNL
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

On 20.05.20 22:36, Carsten Strotmann wrote:
> Hi,
>=20
> Carsten Strotmann <cas@strotmann.de> writes:
>=20
>> Hi,
>>
>> after the nice meeting we had in 2018, I've started planning a meeting=

>> for 2020 (I'm an optimist).
>>
>> So far, there is no date or location, but I've updated the website:
>> <https://m68kmeeting.linuxkistchen.de/>
>>
>> If the current COVID-19 situation will continue over the summer, the
>> event could be held in cyberspace as a virtual conference. Maybe it is=

>> alwys a good idea to offer an virtual attendance option for people who=

>> cannot travel.
>>
>> I'm interested in feedback on possible locations, dates, virtual
>> conferences and such.
>>
>> Stay save
>>
>> Carsten
>=20
>=20
> after collecting some feedback, we will now try to get a small online
> workshop organized to discuss a possible 2020 m68k meeting (virtual or/=
and
> in person).
>=20
> Here is a poll for a date for the planning workshop (not for the m68k
> meeting):
>=20
> <https://nuudel.digitalcourage.de/li1otkp9sBrzu9Xm>
>=20
> The meeting time would be 20:00 CEST.
>=20
> I operate a Jitsi Video-Conference-Server we could use for the meeting,=

> but I'm also open for other options.

the meeting will be this coming Friday 5th June 20:00 CEST on the Jitsi
Videoconferencing server:

<https://meet.forth-ev.de/m68k>

There is currently password protection enabled for this server, the
server will be open 30 minutes before the meeting starts.

Topics to discuss (non exhaustive):

 * virtual and/or in-person meeting options
 * location
 * date and time
 * scope (Topics for the meeting)
 * Agenda for meeting (Talks? Moderated Discussions? Training for new
project members ....)

If you have additions to the Agenda let me know.

See you there

Carsten


--OPxzAiAQZvcGhJayzZIs7SishxdVBXBNL--

--kD01kgKi7dBibvbPOMBqo6aEDHL9AwI7C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEhUZjXZ9rvJXjcufGTH6A3k9sL0IFAl7U3YIACgkQTH6A3k9s
L0I/+xAAhB7MlSWR7nmcNUXkjzrUclgoV9FD62tPrKIOWC+ognXs4uGnrxEz/V1x
ijltPuzDIGsPwxj1HXfXU0uRh3UlAbpAoN1EPzDv8B9ES/kDSD3o3QO9chuuN59I
EDjsrRMp73nCMvkqxl4SuCqk4guk+ZqIzt7dOPDP0NquqFHNHQTaJ7rMG+iC72Tn
yGbxdmqGA35GcocIjOLgoXKA+AkAwxSjjyOEIhFcEWgfeBzWM1/TtGRDoCPBJIty
j70C6xVcCbvFZtScSe7gGje9G+xgql7gNDiD2ZUYzwzDmJB7jU2ZZUaWVSn8hD/B
qurN9RG6UjJU05kckz50Sm3eKv91+MmLSeP6BF+Q4yYbo2/8A5a/6Ks+9VY6iJWk
iEPO4bcTlnVlkm3fFQfGtU+DZBkoENiQFrWzKuQ0WJC7p1TZIHyy+lYemob913+F
Z35f6r0KIQGYf9t+nUGOdYDd/myvQHfHo7GP8l6LqD5lQ1QEtdv+lJJ+jug9MTOM
fOssOX/N/XV45q9eM23cpD84GBBlcpxuOFUQAq0cGRB//3257FM4GV5kKMPeisU7
2220ef6n/aW37uMfhI+i7ojLFujM0L2uEKOi9qbml1pTlKFOvAbibifqoVBYkaCz
B09MWWI+xg10sYeqNf7ooziMEaiY71QFYUNwBF/IiFwUtqQIC/Q=
=tTaQ
-----END PGP SIGNATURE-----

--kD01kgKi7dBibvbPOMBqo6aEDHL9AwI7C--
