From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/9] Removing dead code
Date: Mon, 23 Aug 2010 16:46:09 +0200
Message-ID: <AANLkTimiLhhTW=XRD4hSdsKxnNdKaMSDLUgOeVR=SCJf@mail.gmail.com>
References: <cover.1280924671.git.qy03fugy@stud.informatik.uni-erlangen.de>
	<4C5F9715.1030806@snapgear.com> <86tyn4ximi.fsf@peer.zerties.org>
	<861v9ptzex.fsf@peer.zerties.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-pcmcia-bounces+glkpd-linux-pcmcia=m.gmane.org@lists.infradead.org>
In-Reply-To: <861v9ptzex.fsf@peer.zerties.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-pcmcia>,
	<mailto:linux-pcmcia-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-pcmcia/>
List-Post: <mailto:linux-pcmcia@lists.infradead.org>
List-Help: <mailto:linux-pcmcia-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-pcmcia>,
	<mailto:linux-pcmcia-request@lists.infradead.org?subject=subscribe>
Sender: linux-pcmcia-bounces@lists.infradead.org
Errors-To: linux-pcmcia-bounces+glkpd-linux-pcmcia=m.gmane.org@lists.infradead.org
To: Christian Dietrich <qy03fugy@stud.informatik.uni-erlangen.de>
Cc: linux-m68k@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>, John Stultz <johnstul@us.ibm.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Alexander Kurz <linux@kbdbabel.org>, linux-mtd@lists.infradead.org, Michael Roth <mroth@nessie.de>, Greg Ungerer <gerg@uclinux.org>, Christoph Hellwig <hch@lst.de>, Finn Thain <fthain@telegraphics.com.au>, Tony Lindgren <tony@atomide.com>, vamos-dev@i4.informatik.uni-erlangen.de, Lennart Sorensen <lsorense@csclub.uwaterloo.ca>, Russell King <rmk+kernel@arm.linux.org.uk>, Anatolij Gustschin <agust@denx.de>, Sam Creasey <sammy@sammy.net>, Greg Ungerer <gerg@snapgear.com>, linux-pcmcia@lists.infradead.org, Mike Frysinger <vapier@gentoo.org>, Sean MacLennan <smaclennan@pikatech.com>, Joe Perches <joe@perches.com>, Maxim Kuvyrkov <maxim@codesourcery.com>
List-Id: linux-m68k@vger.kernel.org

T24gTW9uLCBBdWcgMjMsIDIwMTAgYXQgMTI6MDcsIENocmlzdGlhbiBEaWV0cmljaAo8cXkwM2Z1
Z3lAc3R1ZC5pbmZvcm1hdGlrLnVuaS1lcmxhbmdlbi5kZT4gd3JvdGU6Cj4gQ2hyaXN0aWFuIERp
ZXRyaWNoIDxxeTAzZnVneUBzdHVkLmluZm9ybWF0aWsudW5pLWVybGFuZ2VuLmRlPiB3cml0ZXM6
Cj4+PiBJIGRvbid0IGhhdmUgYW55IHByb2JsZW1zIHdpdGggYW55IG9mIHRoZXNlIGZyb20gYQo+
Pj4gbTY4a25vbW11IHBvaW50IG9mIHZpZXcuIEkgY2FuIG1lcmdlIHRoZW0gdmlhIHRoZQo+Pj4g
bTY4a25vbW11IGdpdCB0cmVlIGlmIHlvdSB3YW50Pwo+Pgo+PiBJZiB0aGVyZSBhcmVuJ3QgYW55
IGNvbXBsYWludHMgZnJvbSB0aGUgbTY4ayBwZW9wbGUgaSdtIGZpbmUgd2l0aAo+PiB0aGF0Lgo+
Cj4gSG0sIGxhc3QgbWVzc2FnZSB3YXMgdHdvIHdlZWtzIGFnbywgc28gcGVyaGFwcyB0aGUgbTY4
ayBwZW9wbGUgKHdpdGgKPiBtbXUpIGhhdmUgbm8gY29tcGxhaW50cyB3aXRoIHRoZXNlIHBhdGNo
ZXMgYW5kIHRoZXkgY2FuIGJlIGluY2x1ZGVkIGluCj4gdGhlIG02OGtub21tdSB0cmVlPwoKU29y
cnksIEkndmUgYmVlbiBhIGJpdCB0b28gYnVzeSB3aXRoIG90aGVyIHRoaW5ncy4uLgoKICAtIGFy
Y2gvbTY4azogUmVtb3ZpbmcgZGVhZCBHRzIgY29uZmlnIG9wdGlvbgogICAgRmluZSBmb3IgbWUK
ICAtIGFyY2gvbTY4a3ssbm9tbXV9OiBSZW1vdmluZyBkZWFkIFNNUCBjb25maWcgb3B0aW9uCiAg
ICBBcmUgdGhlcmUgYW55IFNNUCBtNjhrIHN5c3RlbXMgY29taW5nPwogICAgSWYgeWVzLCB3ZSBt
YXkgd2FudCB0byBrZWVwIGl0LiBGcm9tIHRoZSBvdGhlciBoYW5kLCBwcm9iYWJseSBtYW55Cm90
aGVyIHBsYWNlcwogICAgbmVlZCBhZGp1c3RtZW50IGZvciBTTVAgdG9vLCBzbyB0aGUgZmV3IGNo
ZWNrcyBmb3IgQ09ORklHX1NNUCBtYXkgZ2l2ZSBhCiAgICBmYWxzZSBmZWVsaW5nIG9mIHJlYWRp
bmVzcyBmb3IgU01QLgogIC0gYXJjaC9tNjhrbm9tbXU6IFJlbW92aW5nIGRlYWQgTTY4S0ZQVV9F
TVUgY29uZmlnIG9wdGlvbgogICAgV2l0aCB0aGUgaW1taW5lbnQoPykgbWVyZ2Ugb2YgbW11IGFu
ZCBub21tdSwgcGVyaGFwcyB3ZSB3YW50IHRvIGtlZXAgaXQ/CgpHcntvZXRqZSxlZXRpbmd9cywK
CsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEdlZXJ0CgotLQpHZWVydCBVeXR0
ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxp
bnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBl
b3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91
cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4K
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqDCoCDCoMKgIC0tIExpbnVz
IFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBQQ01DSUEgcmVpbXBsZW1lbnRhdGlvbiBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcGNtY2lhCg==
